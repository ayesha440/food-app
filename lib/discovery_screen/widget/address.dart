
import 'package:flutter_geocoder/geocoder.dart' as geoco;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
   Position? position;
   String? addressLocation;
   String? country;
   String? postalcode;


  late GoogleMapController googleMapController;
  Map<MarkerId,Marker> markers=<MarkerId,Marker>{};
  void getMarkers(double lat,double long){
    MarkerId markerId=MarkerId(lat.toString()+long.toString());
    Marker marker=Marker(markerId: markerId,
    position: LatLng(lat, long),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRose
      ),
      infoWindow: InfoWindow(snippet: addressLocation)
    );
    setState(() {
      markers[markerId]=marker;
    });
  }
  void getCurrentLocation()async{
    Position currentPosition=await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position=currentPosition;
    });
  }
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 600,
          child: GoogleMap(
            onTap: (tapped)async{
              final coordinatd=new geoco.Coordinates(tapped.latitude, tapped.longitude);
              var address=await geoco.Geocoder.local.findAddressesFromCoordinates(
                coordinatd
              );
              var firstAddress=address.first;
              getMarkers(tapped.latitude, tapped.longitude);
              await FirebaseFirestore.instance.collection('Location').add({
                'latitude':tapped.latitude,
                "longitude":tapped.longitude,
                "address":firstAddress.addressLine,
                "country":firstAddress.countryName,
                "postalcode":firstAddress.postalCode
              });
              setState(() {
                country=firstAddress.countryName;
                postalcode=firstAddress.postalCode;
                addressLocation=firstAddress.addressLine ;
              });
            },
            mapType: MapType.normal,
              trafficEnabled: true,
              onMapCreated: (GoogleMapController controller){
              setState(() {
                googleMapController=controller;
              });
              },

              initialCameraPosition: CameraPosition(
                target: LatLng(position!.latitude.toDouble(), position!.longitude.toDouble()),
              zoom: 15,

              ),
            markers: Set<Marker>.of(
              markers.values
            ),
          ),

          ),
          Text("Address:$addressLocation"),
      Text("postalcode:$postalcode"),
      Text("country:$country"),
])
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
