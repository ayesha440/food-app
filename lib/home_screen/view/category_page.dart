import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resturant_screen/view/mac.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Back",
          style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xff292D32),
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Burgers",
              style:
              GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 36),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                    height: 49,
                    width: 106,
                    child: const Image(
                        image: AssetImage("assets/images/bbq.png"))),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BBQ Chicken Burger",
                      style: GoogleFonts.inter(
                          fontSize: 17,
                          color: const Color(0xff292D32),
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                            height: 21,
                            width: 20,
                            child: Image(
                                image: AssetImage("assets/images/kfclogo.png"))),
                        SizedBox(width: 5,),
                        Text(
                          "KFC",
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Restaurant()));
                    },
                    child: const Icon(Icons.arrow_forward_ios_rounded)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                    height: 49,
                    width: 106,
                    child: const Image(
                        image: AssetImage("assets/images/bbq.png"))),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BBQ Chicken Burger",
                      style: GoogleFonts.inter(
                          fontSize: 17,
                          color: const Color(0xff292D32),
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                            height: 21,
                            width: 20,
                            child: Image(
                                image: AssetImage("assets/images/kfclogo.png"))),
                        SizedBox(width: 5,),
                        Text(
                          "KFC",
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                    height: 36,
                    width: 36,
                    child: const Image(
                        image: AssetImage("assets/images/mac.png"))),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "McDonald’s",
                      style: GoogleFonts.inter(
                          fontSize: 17,
                          color: const Color(0xff292D32),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "10565 Bramlea Road, Brampton, ON",
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RestaurantMenuScreen()));
                    },
                    child: const Icon(Icons.arrow_forward_ios_rounded)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                    height: 36,
                    width: 36,
                    child: const Image(
                        image: AssetImage("assets/images/mac.png"))),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "McDonald’s",
                      style: GoogleFonts.inter(
                          fontSize: 17,
                          color: const Color(0xff292D32),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "10565 Bramlea Road, Brampton, ON",
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                    height: 36,
                    width: 36,
                    child: const Image(
                        image: AssetImage("assets/images/mac.png"))),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "McDonald’s",
                      style: GoogleFonts.inter(
                          fontSize: 17,
                          color: const Color(0xff292D32),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "10565 Bramlea Road, Brampton, ON",
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
