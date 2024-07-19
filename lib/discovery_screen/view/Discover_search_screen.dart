import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverSearchScreen extends StatelessWidget {
  const DiscoverSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Back",style:  GoogleFonts.inter(
          fontSize: 14,color: const Color(0xff292D32),
          fontWeight: FontWeight.w500 ),),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Discover",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 36),),
                Container(height: 44,width: 48,child: const Image(image: AssetImage("assets/images/pinkbox.png")))
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: const Color(0xffEFF2F5),
                contentPadding:const EdgeInsets.symmetric(horizontal: 10),
                constraints:const BoxConstraints(maxHeight: 52),
                filled: true,
                prefixIcon:const  Icon(Icons.search,size: 24,),
                prefixIconColor:const Color(0xff6A798A),
                hintText: 'Search Food, Restaurants etc',
                hintStyle: GoogleFonts.inter(fontSize: 17,fontWeight: FontWeight.w400,color: const Color(0xffB3BFCB)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recently Searched",style: GoogleFonts.inter(fontSize: 21,fontWeight: FontWeight.w500,color: const Color(0xff292D32)),),
                Text("CLEAR ALL",style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w500,color: const Color(0xffE47070)),),
              ],),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [
              Container(height: 49,width: 106,child: const Image(image: AssetImage("assets/images/bbqchicken.png"))),
              const SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("BBQ Chicken Burger",style: GoogleFonts.inter(
                      fontSize: 17,color: const Color(0xff292D32),
                      fontWeight: FontWeight.w400 ),),
                  Row(
                    children: [
                      const SizedBox(height: 21,width: 20,child: Image(image: AssetImage("assets/images/kfclogo.png"))),
                      SizedBox(width: 5,),
                      Text("KFC",style: GoogleFonts.inter(
                          fontSize: 13,color:  Colors.grey,
                          fontWeight: FontWeight.w400 ),)
                    ],
                  )
                ],),
              const SizedBox(width: 30,),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],),
          ),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              Container(height: 36,width: 36,child: const Image(image: AssetImage("assets/images/kfclogo.png"))),
              const SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("KFC",style: GoogleFonts.inter(
                      fontSize: 17,color: const Color(0xff292D32),
                      fontWeight: FontWeight.w400 ),),
                  Text("10565 Bramlea Road, Brampton, ON",style: GoogleFonts.inter(
                      fontSize: 13,color:  Colors.grey,
                      fontWeight: FontWeight.w400 ),)
                ],),
              const SizedBox(width: 30,),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],),
          ),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              Container(height: 36,width: 36,child: const Image(image: AssetImage("assets/images/mac.png"))),
              const SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("McDonald’s",style: GoogleFonts.inter(
                      fontSize: 17,color: const Color(0xff292D32),
                      fontWeight: FontWeight.w400 ),),
                  Text("10565 Bramlea Road, Brampton, ON",style: GoogleFonts.inter(
                      fontSize: 13,color: Colors.grey,
                      fontWeight: FontWeight.w400 ),)
                ],),
              const SizedBox(width: 30,),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],),
          ),
          const SizedBox(height: 10,),
          const Divider(),
        ],),
    );
  }
}