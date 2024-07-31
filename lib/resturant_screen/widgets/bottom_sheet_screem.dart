import 'package:flutter/material.dart';
import 'package:food_app/favourite_screen/view/fav_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class BottomSheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Row(
           children: [
             Image.asset("assets/images/user.png"),
             SizedBox(width: 10,),
             Text("Order with Friends",style: GoogleFonts.inter(
               color: Colors.black,
               fontWeight: FontWeight.w400,
               fontSize: 17
             ),)
           ],
         ),
          SizedBox(height: 10),
          Divider(color: Colors.black12,),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset("assets/images/heart.png"),
              SizedBox(width: 10,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavoriteScreen()));
                },
                child: Text("Add to Favourites",style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17
                ),),
              )
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.black12,),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset("assets/images/send.png"),
              SizedBox(width: 10,),
              Text("Share to...",style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 17
              ),)
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.black12,),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset("assets/images/infoblack.png"),
              SizedBox(width: 10,),
              Text("Report Store",style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 17
              ),)
            ],
          ),
          SizedBox(height: 10),


          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close',style: GoogleFonts.inter(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}