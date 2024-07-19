import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/discovery_screen/widget/itembox.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainorWidget extends StatelessWidget {
  const ContainorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mheight=MediaQuery.of(context).size.height;
    var mwidth=MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,),
      child: Container(
        height:mheight*0.3 ,width: mwidth*0.8,
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: mwidth*0.05,
                      backgroundImage: AssetImage("assets/images/Logo.png"),
                    ),
                    SizedBox(width: mwidth*0.02,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text("McDonald’s",style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: mwidth*0.05
                          ),),
                        Row(
                          children: [
                            Image.asset("assets/images/location.png", color: Color(0xffB3BFCB),height: mheight*0.02,),
                            SizedBox(width: 5,),
                            Text("Bramlea & Sandalwood",style: GoogleFonts.inter(
                                color: Color(0xffB3BFCB),
                                fontSize: mwidth*0.03
                            ),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: mwidth*0.07,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffEFF2F5),
                        shape: BoxShape.circle
                      ),
                      child: Icon(Icons.favorite,color: Color(0xffB3BFCB),),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/bluesend.png",height: 50,width: 20,),
                        Text("200m",style: GoogleFonts.inter(
                            color:Color(0xff46505D) ,
                        fontSize: 13
                        ),)
                      ],
                    ),

                   Row(
                     children: [
                       StarRate(),
                       Text("(1,293)",style: GoogleFonts.inter(
                         color: Color(0xffB3BFCB),
                         fontSize: 12
                       ),),
                     ],
                   ),
                    TextButton(onPressed: (){},
                        child: Text("open",style: GoogleFonts.inter(
                          color: Color(0xff28B996),
                          fontSize: 13,
                        ),))
                    
                  ],
                ),
         SizedBox(height: 20,),
         // item row
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Container(height: mheight*0.1,width: mwidth*0.23,
                       decoration: BoxDecoration(
                         color: Color(0xffEFF2F5),
                         borderRadius: BorderRadius.circular(10),

                       ),
                       child: Image.asset("assets/images/bbq.png"),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Container(height: mheight*0.1,width: mwidth*0.23,
                         decoration: BoxDecoration(
                           color: Color(0xffEFF2F5),
                           borderRadius: BorderRadius.circular(10),

                         ),
                         child: Image.asset("assets/images/bbq.png"),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Container(height: mheight*0.1,width: mwidth*0.23,
                         decoration: BoxDecoration(
                           color: Color(0xffEFF2F5),
                           borderRadius: BorderRadius.circular(10),

                         ),
                         child: Image.asset("assets/images/bbq.png"),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Container(height: mheight*0.1,width: mwidth*0.23,
                         decoration: BoxDecoration(
                           color: Color(0xffEFF2F5),
                           borderRadius: BorderRadius.circular(10),

                         ),
                         child: Image.asset("assets/images/bbq.png"),
                       ),
                     ),
                   ],
                 ),
               )
              ],),
          ),
      ),
    );
  }
   
  StarRate(){
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 6,
      itemSize: 12,
      itemBuilder: (contex,_)=> const Icon(Icons.star,color: Colors.amber,),


      onRatingUpdate: (rating)=> debugPrint(rating.toString()),
    );
  }
}
