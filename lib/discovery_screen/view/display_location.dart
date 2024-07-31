import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class DisplayLocationScreen extends StatefulWidget {
  const DisplayLocationScreen({super.key});

  @override
  State<DisplayLocationScreen> createState() => _DisplayLocationScreenState();
}

class _DisplayLocationScreenState extends State<DisplayLocationScreen> {
  String address = '';

  Future<void> _saveLocationToFirebase(String address) async {
    await FirebaseFirestore.instance.collection('locations').add({
      'address': address,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> _getCurrentUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      log("Location Denied");
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions are denied.');
      }
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String street = place.street ?? '';
      String locality = place.locality ?? '';
      String subLocality = place.subLocality ?? '';
      String administrativeArea = place.administrativeArea ?? '';
      String postalCode = place.postalCode ?? '';
      String country = place.country ?? '';

      String address1 = '';
      if (street.isNotEmpty) {
        address1 += street;
      }
      if (locality.isNotEmpty) {
        address1 += ', $locality';
      }
      if (subLocality.isNotEmpty) {
        address1 += ', $subLocality';
      }
      if (administrativeArea.isNotEmpty) {
        address1 += ', $administrativeArea';
      }
      if (postalCode.isNotEmpty) {
        address1 += ', $postalCode';
      }
      if (country.isNotEmpty) {
        address1 += ', $country';
      }

      setState(() {
        address = address1;
      });
    } else {
      setState(() {
        address = 'No address available for this location.';
      });
    }
    await _saveLocationToFirebase(address);
  }

  Future<void> _updateCurrentLocation() async {
    await _getCurrentUserLocation();
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Locations'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _updateCurrentLocation,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (address.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Address: $address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('locations').orderBy('timestamp', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                var locations = snapshot.data!.docs;
                if (locations.isEmpty) {
                  return Text('No address available');
                }

                var location = locations.first;
                var address = location['address'];
                var timestamp = location['timestamp'] as Timestamp?;

                String dateString = 'No date available';
                if (timestamp != null) {
                  var date = timestamp.toDate();
                  dateString = date.toString();
                }


                return ListTile(
                  title: Text(address),
                  subtitle: Text('Saved on: $dateString'),
                );
                //   ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: locations.length,
                //   itemBuilder: (context, index) {
                //     var location = locations[index];
                //     var address = location['address'];
                //     var timestamp = location['timestamp'] as Timestamp?;
                //
                //     String dateString = 'No date available';
                //     if (timestamp != null) {
                //       var date = timestamp.toDate();
                //       dateString = date.toString();
                //     }
                //
                //     return ListTile(
                //       title: Text(address),
                //       subtitle: Text('Saved on: $dateString'),
                //     );
                //   },
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
