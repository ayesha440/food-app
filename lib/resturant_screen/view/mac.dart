import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/meal_screen/view/meal_full_screen.dart';
import 'package:food_app/resturant_screen/view/search_screen.dart';
import 'package:food_app/resturant_screen/widgets/bottom_sheet_screem.dart';

class Restaurant extends StatelessWidget {
  const Restaurant ({super.key});

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
            child: InkWell(
                onTap: (){
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return BottomSheetScreen();
                });},
                child: Image.asset("assets/images/More.png"))
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchScreen()));
                },
                child: Image.asset("assets/images/Search Icon.png"))
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
                    image: AssetImage("assets/images/bb.png"),
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
                  backgroundImage: AssetImage("assets/images/Logo.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("McDonald's",style: TextStyle(
                        color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/location.png",color: Colors.black,),
                        Text(" Bramlea & Sandalwood",style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: size.width*0.03),)
                      ],
                    ),
                  ],
                ),
                SizedBox(width: size.width*0.05,),
                CircleAvatar(
                  backgroundColor:  Color(0xFFB3BFCB).withOpacity(0.5),
                  radius: size.width*0.07,
                  child: Icon(Icons.favorite,color: Colors.grey,),
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
                                    image: AssetImage("assets/images/box.png"),
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
                                    image: AssetImage("assets/images/redbox.png"),
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
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MealFullScreen()));
                      },
                      child: CircleAvatar(
                        backgroundColor:  Colors.white.withOpacity(0.5),
                        radius: size.width*0.07,
                        child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                      ),
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
