import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/resturant_screen/widgets/custom_widget.dart';

class Kfc extends StatelessWidget {
  const Kfc ({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.keyboard_backspace),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: Image.asset("assets/images/More.png")
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: Image.asset("assets/images/Search Icon.png")
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: Image.asset("assets/images/Cart.png")
          ),
        ],

      ),
      body: Column(
        children: [
          Container(
            height: size.height*0.27,
            width: size.width*1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/kfc.png"),
                    fit: BoxFit.cover
                )
            ),
          ),

         CustomResturantLogoWidget(locationNmae: "Bramlea & Sandalwood",
             logoImage: "assets/images/kfclogo.png", resturantNmae: "KFC"),

          Container(
            height: size.height*0.17,
            width: size.width*0.85,
            decoration: BoxDecoration(
              color: Color(0xFFB3BFCB).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical:size.width*0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: size.height*0.027,
                            width: size.width*0.06,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/star.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Text(" Ratings:"),
                          Text("4.5"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: size.height*0.027,
                            width: size.width*0.06,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/box-time.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Text(" Delivers in "),
                          Text("15-20 min "),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: size.height*0.023,
                            width: size.width*0.05,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/element-2.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Text(" Burgers"),
                        ],
                      ),

                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor:  Colors.white.withOpacity(0.5),
                      radius: size.width*0.07,
                      child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Row(
          //   children: [
          //     Text("Breakfast Menu",style: TextStyle (fontSize: size.width*0.04,color: Colors.grey.withOpacity(0.4)),),
          //   ],
          // ),
          //


        ],
      ),
    );
  }
}
