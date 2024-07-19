import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealCollapesedScreen extends StatelessWidget {
  const MealCollapesedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Back",style:  GoogleFonts.inter(
            fontSize: 14,color: const Color(0xff292D32),
            fontWeight: FontWeight.w500 ),),
        actions: [Container(
          height: 27,
          width: 27,
          child: InkWell(
            onTap: () {},
            child: Image.asset("assets/images/More.png"),
          ),
        ),
          const SizedBox(width: 30),
          Container(
            height: 27,
            width: 27,
            child: InkWell(
              onTap: () {},
              child: Image.asset("assets/images/Cart.png"),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 20),
              child: Container(width: 438,height: 198,child:const Image(image: AssetImage("assets/images/meal.png"))),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(

                children: [
                  Text("Western BBQ", style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 27),),
                  const SizedBox(width: 30,),
                  Text("340-400 Cals", style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14,color: Colors.grey),),
                  const SizedBox(width: 5,),
                  Icon(Icons.info_outline,color: Colors.grey,size: 20,)
                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Cheeseburger Meal",style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 27),),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 390,
              height: 56,
              color: const Color(0xffEFF2F5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Side Item",style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 17,color: const Color(0xff000000)),),
                  ),
                  const SizedBox(width: 159,),
                  Text("Required",style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12,color: const Color(0xff28B996)),),
                  const SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    height: 28,
                    width: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: const Color(0xffB3BFCB)),
                    child: const Icon(Icons.add,color: Colors.white,size: 29,),
                  )
                ],),
            ),
            const SizedBox(height: 5,),
            Container(
              width: 390,
              height: 56,
              color: const Color(0xffEFF2F5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Drinks",style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 17,color: const Color(0xff000000)),),
                  ),
                  const SizedBox(width: 185,),
                  Text("Required",style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12,color: const Color(0xff28B996)),),
                  const SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    height: 28,
                    width: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: const Color(0xffB3BFCB)),
                    child: const Icon(Icons.add,color: Colors.white,size: 29,),
                  )
                ],),
            ),
            const SizedBox(height: 5,),
            Container(
              width: 390,
              height: 56,
              color: const Color(0xffEFF2F5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Edit Cheeseburger",style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 17,color: const Color(0xff000000)),),
                  ),
                  const SizedBox(width: 85,),
                  Text("Optional",style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12,color: const Color(0xffF5A94F)),),
                  const SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    height: 28,
                    width: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: const Color(0xffB3BFCB)),
                    child: const Icon(Icons.add,color: Colors.white,size: 29,),
                  )
                ],),
            ),
            const SizedBox(height: 15,),




            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 268,
                    height: 62,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Color(0xff292D32)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Icon(Icons.shopping_bag_outlined,color: Colors.grey,size: 20,),
                        const SizedBox(width: 5,),
                        Text("Add to Bag", style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize:18,color: Color(0xffFFFFFF)),),
                        const SizedBox(width:55,),
                        Text("\$6.69", style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize:16,color: Color(0xff28B996)),),
                      ],),
                    ),
                  ),
                  Container(
                      height: 62,width: 62,
                      decoration: BoxDecoration(
                        color: Color(0xffFAD6D6),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Color(0xffE47070),))
                  )
                ],),
            ),

          ],),
      ),
    );
  }
}

