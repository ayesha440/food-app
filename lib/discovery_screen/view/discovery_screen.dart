import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/discovery_screen/view/Discover_search_screen.dart';
import 'package:food_app/discovery_screen/widget/containor_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  CustomInfoWindowController _customInfoWindowController=CustomInfoWindowController();
  Completer<GoogleMapController> _controller=Completer();
  Uint8List? markerImage;
  static final CameraPosition _kGooglePlex=const CameraPosition(
      target: LatLng(30.2426, 71.4850 ),
  zoom: 12,
  );
  final List<Marker> _markers=<Marker>[];
  List<String> images=[
    "assets/images/mlogo.png",
    "assets/images/hardees.jpeg",
    "assets/images/kfclogo.png",
    "assets/images/subway.png"
  ];
  List<String> title=[
    "McDonald's",
    "Hardee's",
    "KFC",
    "Subway"
  ];
final List<LatLng> _latlng=<LatLng>[
  LatLng(30.2426, 71.4850 ),LatLng(30.2182, 71.4729),
  LatLng(313120.94, 741724.31),LatLng(30.1955, 71.4410)
];
Future<Uint8List> getBytesFromAssets(String path,int width)async{
  ByteData data=await rootBundle.load(path);
  ui.Codec codec=await ui.instantiateImageCodec(data.buffer.asUint8List(),targetWidth: width);
  ui.FrameInfo fi=await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}
@override
  void initState() {
    super.initState();
    loadData();
  }

   loadData()async{
  for(int i=0 ; i<_latlng.length; i++){
    final Uint8List markerIcon=await getBytesFromAssets(images[i], 100);
    _markers.add(
      Marker(markerId: MarkerId(i.toString()),
      position: _latlng[i],
        icon: BitmapDescriptor.fromBytes(markerIcon),
        onTap: (){
        _customInfoWindowController.addInfoWindow!(
          Text(""),
        _latlng[i]
        );
        },
        infoWindow: InfoWindow(
          title: title[i],
        )
      )
    );
    setState(() {

    });
  }
   }

  @override
  Widget build(BuildContext context) {
    var mheight=MediaQuery.of(context).size.height;
    var mwidth=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [

          GoogleMap(
              initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: true,
                 onTap: (postition){
                _customInfoWindowController.hideInfoWindow!();
                 },
            onCameraMove: (position){
                _customInfoWindowController.onCameraMove!();
            },
            markers: Set<Marker>.of(_markers),
            onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
                _customInfoWindowController.googleMapController=controller;

            },
          ),
          CustomInfoWindow(controller: _customInfoWindowController,height: 50,width: 50,offset: 30,),
          SizedBox(
            height: mheight*0.15,
            width: double.infinity,
            child: ClipRRect(child: Image.asset("assets/images/trans.png",fit: BoxFit.cover,),),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Discover",style: GoogleFonts.inter(color: Colors.black,
                     fontSize: 33,
                       fontWeight: FontWeight.w600
                     ),),
                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DiscoverSearchScreen()));
                          },
                          child: Image.asset("assets/images/Search Icon.png")),
                      Image.asset("assets/images/Cart.png")
                    ],
                  )
                ],),
              ),
              // Image.asset("assets/images/dislogo.png"),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(

                    children: [
                      ContainorWidget(),
                      ContainorWidget(),
                      ContainorWidget(),

                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
