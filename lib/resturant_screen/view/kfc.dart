import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/resturant_screen/models/restaurent/restaurent_model.dart';

class Kfc extends StatelessWidget {
  final RestaurentModel restaurent;
  const Kfc ({super.key, required this.restaurent});

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
                    image: AssetImage(restaurent.restaurentImage),
                    fit: BoxFit.cover
                )
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: size.width*0.03,horizontal:size.width*0.05 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: size.width*0.08,
                  backgroundImage: AssetImage(restaurent.logoImage),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurent.name,style: TextStyle(
                        color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset("assets/images/location.svg",color: Colors.black,),
                        Text(restaurent.location,style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: size.width*0.03),)
                      ],
                    ),
                  ],
                ),
                SizedBox(width: size.width*0.05,),
                CircleAvatar(
                  backgroundColor:  Color(0xFFB3BFCB).withOpacity(0.5),
                  radius: size.width*0.07,
                  child: IconButton(onPressed: () {

                  }, icon: Icon(Icons.favorite))
                ),
              ],
            ),
          ),

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
                          Text(restaurent.ratings.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: size.height*0.027,
                            width: size.width*0.06,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/box.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Text(" Delivers in "),
                          Text(restaurent.deliveryTime),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: size.height*0.023,
                            width: size.width*0.05,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/redbox.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Text(restaurent.category),
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
