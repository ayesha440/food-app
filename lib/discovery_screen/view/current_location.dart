import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/home_screen/controller/address.dart';
import 'package:food_app/home_screen/view/home_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'display_location.dart';

class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({super.key});

  @override
  State<UserCurrentLocation> createState() => _UserCurrentLocationState();
}

class _UserCurrentLocationState extends State<UserCurrentLocation> {


  String locationMessage="Current location of user";
  String? lat;
  String? lng;

  Future<void> _saveLocationToFirebase(String address) async {
    await FirebaseFirestore.instance.collection('locations').add({
      'address': address,

      'timestamp': FieldValue.serverTimestamp(),
    });
  }
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

    // Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    // log("Latitude=${currentPosition.latitude}, Longitude=${currentPosition.longitude}");
    // lat = currentPosition.latitude.toString();
    // lng = currentPosition.longitude.toString();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String street = place.street?? '';
      String locality = place.locality?? '';
      String subLocality = place.subLocality?? '';
      String administrativeArea = place.administrativeArea?? '';
      String postalCode = place.postalCode?? '';
      String country = place.country?? '';

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
    return position;
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
  String address='';
  Future<void> _openMap(String address)async{
    String googleUrl=
        'http://www.google.com/maps/search/?api=1&guery=$address';
    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw 'could not launch $googleUrl';
  }
  @override
  void initState() {
    _getCurrentUserLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    log('${locationMessage}');

    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 30,right: 20,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: (){
            Navigator.pop(context);
            },
                child: Icon(Icons.arrow_back,color: Colors.black,)),
            Container(
              height:size.height*0.2 ,
              width: size.width*0.8,
              child: Image.asset("assets/images/map11.png"),
            ),
            Text("Allow Location Access on the next screen for:",style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: size.height*0.03,),

            Row(
              children: [
                ClipRRect(child: Image.asset("assets/images/icon1.png",height: 30,width: 30,),),
                Text("Fininding the best restaurents \n near you",style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,

                ),)
              ],
            ),
            SizedBox(height: size.height*0.02,),
            Row(
              children: [
                ClipRRect(child: Image.asset("assets/images/icon2.png",height: 30,width: 30,),),
                Text("Faster and more accurate delivery",style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,


                ),)
              ],
            ),
            SizedBox(height: size.height*0.02,),
            // Text("Click here for access",style: GoogleFonts.inter(
            //     color: Colors.black,
            //     fontSize: 20,
            //     fontWeight: FontWeight.w800
            // ),),
            SizedBox(height: size.height*0.01,),

            ElevatedButton(onPressed: (){
              _getCurrentUserLocation().then((value){
                lat='${value.latitude.toString()}';
                lng='${value.longitude.toString()}';
                setState(() {
                  locationMessage='Latitude:$lat,Longitude:$lng';
                });
                _liveLocation();
              });
            },
                style:  ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                    const MaterialStatePropertyAll(Color(0xFFEA985B)),
                    minimumSize: const MaterialStatePropertyAll(Size(332, 38))
                ),
                child: Text("Location Access",style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),)),
            SizedBox(height: size.height*0.01,),

            ElevatedButton(onPressed: (){

              _openMap(address);
            },
                style:  ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                    const MaterialStatePropertyAll(Color(0xFFEA985B)),
                    minimumSize: const MaterialStatePropertyAll(Size(332, 38))

                ),
                child: Text("Get Current Location",style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
                )),
            Text(
              address,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.17),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayLocationScreen()),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                backgroundColor:  MaterialStateProperty.all(Color(0xFFEA985B)),
                  minimumSize: const MaterialStatePropertyAll(Size(332, 38))

              ),
              child: Text(
                "Show Saved Locations",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
