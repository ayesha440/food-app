import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/discovery_screen/view/current_location.dart';
import 'package:food_app/home_screen/controller/address.dart';
import 'package:food_app/utensills_screens/all_utensills.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resturant_screen/view/harvey.dart';
import '../../resturant_screen/view/kfc.dart';
import '../../resturant_screen/view/mac.dart';
import '../controller/hone_screen_controller.dart';
import 'all_category.dart';
import 'category_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key,});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Image> image = [
    Image.asset('assets/images/bb.png'),
    Image.asset("assets/images/grocry.png"),
    Image.asset("assets/images/salad.png"),
    Image.asset("assets/images/Frame.png"),
    Image.asset("assets/images/tea.png"),
    Image.asset("assets/images/arrow.png"),
  ];
  List<String> text = [
    "Burgers",
    "Grocery",
    "Salads",
    "Sweets",
    "Utenlis",
    "See All",
  ];
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
    var size = MediaQuery.of(context).size;

    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: size.height*0.05,right: size.height*0.18),
              child: Text("Good Evening",style: TextStyle(
                  color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
              ),),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.07),
              child: Container(
                height: size.height*0.06,
                width: size.width*0.83,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.blueGrey.withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(Icons.search,size: 25,color: Colors.blueGrey.withOpacity(0.4)),
                    hintText: "Search Food, Restaurants etc.",
                    hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(0.3),fontWeight:FontWeight.w400,fontSize: size.width*0.04),
                  ),
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top: size.width*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(
              height: size.height * 0.05,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  color: Color(0xFFFCE2CF).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 5),
                  child: InkWell(
                    onTap: () {
                      _updateCurrentLocation();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserCurrentLocation()));
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/location.png"),
                          SizedBox(width: size.width*0.02,),
                          if (address.isNotEmpty)
                            Text(
                              ' $address',
                              style: TextStyle(color: Color(0xFFEA985B).withOpacity(0.7)),
                            ),
                          // Text(
                          //   $address ,
                          //   style: TextStyle(color: Color(0xFFEA985B).withOpacity(0.7)),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                  SizedBox(width: size.width*0.05,),

                  Container(
                    height: size.height*0.05,
                    width: size.width*0.35,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCE2CF).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/clock.png"),
                        Text("Order Now",style: TextStyle(color: Color(0xFFEA985B).withOpacity(0.7)),)
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: size.height*0.24,top: 13),
              child: Text("Categories",style: TextStyle(
                  color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.w600
              ),),
            ),

            Column(

              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: image.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 120,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (index == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const AllCategoriesScreen()));
                            }else if(index==0){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const CategoryPage()));}

                            else if(index==4){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) =>
                            const All_Utensils()));
                            };
                          },
                          child: Container(
                            height: 103,
                            width: 119,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: const Color(0xffEA985B).withOpacity(0.08)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: image[index],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  text[index],
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                const Divider(
                  height: 1,
                  color: Color(0xffD5DEE7),
                ),


              ],
            ),
            Padding(
              padding:  EdgeInsets.only(right: size.height*0.184),
              child: Text("Offers Near you",style: TextStyle(
                  color: Colors.black,fontSize: size.width*0.055,fontWeight: FontWeight.w600
              ),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                children: [
                  Container(
                    height: size.height*0.17,
                    width: size.width*0.7,
                    margin: EdgeInsets.only(left:size.width*0.03),
                    child: Image.asset("assets/images/3burger.png"),
                  ),
                  Container(
                    height: size.height*0.17,
                    width: size.width*0.7,
                    // margin: EdgeInsets.only(left:size.width*0.01),
                    child: Image.asset("assets/images/3burger.png"),
                  ),
                  Container(
                    height: size.height*0.17,
                    width: size.width*0.7,
                    margin: EdgeInsets.only(left:size.width*0.02),
                    child: Image.asset("assets/images/3burger.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Padding(
              padding:  EdgeInsets.only(right: size.height*0.18),
              child: Text("New & Trending",style: TextStyle(
                  color: Colors.black,fontSize: size.width*0.055,fontWeight: FontWeight.w600
              ),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                children: [
                  InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Harveys(),));},
                      child: NewCategories(name: "Harveys", img: "assets/images/3burger.png", avatar: "assets/images/hlogo.png",)),
                  InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Kfc(),));},
                      child: NewCategories(name: "KFC", img: "assets/images/kfc.png", avatar: "assets/images/kfclogo.png",)),
                  InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Restaurant(),));},
                      child: NewCategories(name: "McDonalds", img: "assets/images/meal.png", avatar: "assets/images/Logo.png",)
                  ),



                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}


