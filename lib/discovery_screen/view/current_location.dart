import 'dart:developer';
import 'package:food_app/discovery_screen/widget/address.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({super.key});

  @override
  State<UserCurrentLocation> createState() => _UserCurrentLocationState();
}

class _UserCurrentLocationState extends State<UserCurrentLocation> {


  String locationMessage="Current location of user";
  late String lat;
  late String lng;
  Future<Position> _getCurrentUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
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

    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    log("Latitude=${currentPosition.latitude}, Longitude=${currentPosition.longitude}");

    return currentPosition;
  }
  void _liveLocation(){
    LocationSettings locationSettings=const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100
    );
    Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position){
      lat=position.latitude.toString();
      lng=position.longitude.toString();
      setState(() {
        locationMessage='Latitude:$lat,Longitude:$lng';
      });
    });
  }
  Future<void> _openMap(String lat,String lng)async{
    String googleUrl=
        'http://www.google.com/maps/search/?api=1&guery=$lat,$lng';
    await canLaunchUrlString(googleUrl)
    ? await launchUrlString(googleUrl)
        : throw 'could not launch $googleUrl';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            _getCurrentUserLocation().then((value){
              lat='${value.latitude}';
              lng='${value.longitude}';
              setState(() {
                locationMessage='Latitude:$lat,Longitude:$lng';
              });
              _liveLocation();
            });
          },
              child: Text("Location Access")),
          ElevatedButton(onPressed: (){
            _openMap(lat,lng);
          },
              child: Text("Google Map"))
        ],
      ),
    );
  }
}
