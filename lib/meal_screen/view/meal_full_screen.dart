import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/meal_screen/view/meal_collapesed_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_add_on_screen.dart';

class MealFullScreen extends StatefulWidget {
  const MealFullScreen({super.key});

  @override
  State<MealFullScreen> createState() => _MealFullScreenState();
}

class _MealFullScreenState extends State<MealFullScreen> {
  bool isSelected = false;
  bool isSelected1 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,

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
          Container(
            height: 27,
            width: 27,
            child: InkWell(
              onTap: () {},
              child: Image(image: AssetImage("assets/images/Cart.png")),
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
              child: Container(width: 430,height: 197,child:const Image(image: AssetImage("assets/images/meal.png"))),

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
                  const  Icon(Icons.info_outline,color: Colors.grey,size: 20,)
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
                    child: const Icon(Icons.remove,color: Colors.white,size: 29,),
                  )
                ],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const SizedBox(height: 18,width: 82,child: Image(image: AssetImage("assets/images/f.png"))),
                  const Text("Medium Fries",),
                  Spacer(),
                  // const SizedBox(width: 70,),

                  if(isSelected == true)
                    const Text("+\$2.90"),
                  // const SizedBox(width: 5,),
                  Radio(value: true,
                    activeColor: Color(0xffF4739E),
                    groupValue: isSelected, onChanged: (value) {
                      print('value $value');
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },),
                ],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const SizedBox(height: 18,width: 82,child: Image(image: AssetImage("assets/images/large.png"))),
                  const Text("Large Fries",),
                  Spacer(),
                  // const SizedBox(width: 70,),

                  if(isSelected == false)
                    const Text("+\$2.90"),
                  // const SizedBox(width: 5,),
                  Radio(value: false,
                    activeColor: Color(0xffF4739E),
                    groupValue: isSelected, onChanged: (value) {
                      print('value $value');
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },),
                ],),
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
                    child: const Icon(Icons.remove,color: Colors.white,size: 29,),
                  )
                ],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text("Soft Drinks",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 17),),
                  const SizedBox(width: 190,),
                  Radio(
                    activeColor: Color(0xffF4739E),
                    value: true,
                    groupValue: isSelected1, onChanged: (value) {
                    print('value $value');
                    setState(() {
                      isSelected1 = !isSelected1;
                    });
                  },),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text("Juices",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 17),),
                  const SizedBox(width: 229,),
                  Radio(

                    activeColor: Color(0xffF4739E),
                    value: false,
                    groupValue: isSelected1, onChanged: (value) {
                    print('value $value');
                    setState(() {
                      isSelected1 = !isSelected1;
                    });
                  },),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditAddOnScreen()));
                },
                child: Container(
                  width: 358,
                  height: 73,
                  decoration: BoxDecoration(color: const Color(0xffFFFFFF),border: Border.all(color: const Color(0xffB3BFCB)),borderRadius: BorderRadius.circular(14)),
                  child: Row(children: [
                    const SizedBox(width: 15,),
                    const SizedBox(height: 33,width: 38   ,child: Image(image: AssetImage("assets/images/glass.png"))),
                    const SizedBox(width: 10,),
                    Text("Fruit Punch Juice", style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 17),),
                    const SizedBox(width: 50,),
                    Text("Edit", style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14),),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],),
                ),
              ),
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
                    child: Text("Edit Cheeseburger",style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 17,color: const Color(0xff000000)),),
                  ),
                  const SizedBox(width: 150,),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    height: 28,
                    width: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: const Color(0xffB3BFCB)),
                    child: const Icon(Icons.remove,color: Colors.white,size: 29,),
                  )
                ],),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  const SizedBox(height: 30,width: 100,child: Image(image: AssetImage("assets/images/bun.png"))),
                  Text("Sesame Seed Bun",style: GoogleFonts.inter(fontSize:16,fontWeight: FontWeight.w500),),
                  const SizedBox(width: 45,),
                  Text("Edit", style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 14),),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 10,),
                const SizedBox(height: 18,width: 82,child: Image(image: AssetImage("assets/images/f.png"))),
                const SizedBox(width: 15,),
                Text("BBQ Sauce",style: GoogleFonts.inter(fontSize:16,fontWeight: FontWeight.w500),),
                const SizedBox(width: 63,),

                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),color: const Color(0xff2D3943)),
                  child: const Icon(Icons.remove,color: Colors.white,size: 32,),
                ),
                const SizedBox(width: 5,),
                Text("1",style: GoogleFonts.inter(fontSize:17,fontWeight: FontWeight.w400),),
                const SizedBox(width: 5,),

                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),color: const Color(0xff2D3943)),
                  child: const Icon(Icons.add,color: Colors.white,),
                )
              ],),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 10,),
                const SizedBox(height: 34,width: 100,child: Image(image: AssetImage("assets/images/beaf.png"))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Beef Patty",style: GoogleFonts.inter(fontSize:16,fontWeight: FontWeight.w500),),
                    Text("\$1.59 ea",style: GoogleFonts.inter(fontSize:13,fontWeight: FontWeight.w400,color: Color(0xffEA985B)),),
                  ],
                ),
                const SizedBox(width: 63,),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),color: const Color(0xff2D3943)),
                  child: const Icon(Icons.remove,color: Colors.white,size: 32,),
                ),
                const SizedBox(width: 5,),
                Text("1",style: GoogleFonts.inter(fontSize:17,fontWeight: FontWeight.w400),),
                const SizedBox(width: 5,),

                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),color: const Color(0xff2D3943)),
                  child: const Icon(Icons.add,color: Colors.white,),
                )
              ],),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 10,),
                const SizedBox(height: 34,width: 100,child: Image(image: AssetImage("assets/images/cheese.png"))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cheese",style: GoogleFonts.inter(fontSize:16,fontWeight: FontWeight.w500),),
                    Text("\$0.59 ea",style: GoogleFonts.inter(fontSize:13,fontWeight: FontWeight.w400,color: Color(0xffEA985B)),),
                  ],
                ),
                const SizedBox(width: 85,),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),color: const Color(0xff2D3943)),
                  child: const Icon(Icons.remove,color: Colors.white,size: 32,),
                ),
                const SizedBox(width: 5,),
                Text("1",style: GoogleFonts.inter(fontSize:17,fontWeight: FontWeight.w400),),
                const SizedBox(width: 5,),

                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),color: const Color(0xff2D3943)),
                  child: const Icon(Icons.add,color: Colors.white,),
                )
              ],),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 10,),
                const SizedBox(height: 20,width: 90,child: Image(image: AssetImage("assets/images/bana.png"))),
                Text("Banana Peppers",style: GoogleFonts.inter(fontSize:16,fontWeight: FontWeight.w500),),
                const SizedBox(width: 30,),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),color: const Color(0xff2D3943)),
                  child: const Icon(Icons.remove,color: Colors.white,size: 32,),
                ),
                const SizedBox(width: 5,),
                Text("1",style: GoogleFonts.inter(fontSize:17,fontWeight: FontWeight.w400),),
                const SizedBox(width: 5,),

                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),color: const Color(0xff2D3943)),
                  child: const Icon(Icons.add,color: Colors.white,),
                )
              ],),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MealCollapesedScreen()));
                    },
                    child: Container(
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
                          Text("\$8.69", style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize:16,color: Color(0xff28B996)),),
                        ],),
                      ),
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