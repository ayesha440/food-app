import 'package:flutter/material.dart';
import 'package:food_app/resturant_screen/view/search_screen.dart';

import '../widgets/bottom_sheet_screem.dart';

class ResturantMenuScreen extends StatelessWidget {
  const ResturantMenuScreen({super.key});

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
                      showDragHandle: true,
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

      body:

      Padding(
        padding: EdgeInsets.symmetric(vertical: size.width*0.03,horizontal:size.width*0.05 ),
        child: Container(
          height: size.height*0.08,
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
      ),
    );
  }
}
