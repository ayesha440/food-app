import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utensills_screens/all_utensills.dart';
import 'category_page.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  List<Image> image = [
    Image.asset('assets/images/bb.png'),
    Image.asset("assets/images/grocry.png"),
    Image.asset("assets/images/salad.png"),
    Image.asset("assets/images/Frame.png"),
    Image.asset("assets/images/tea.png"),
    Image.asset("assets/images/indian.png"),
    Image.asset("assets/images/pizza.png"),
    Image.asset("assets/images/chicken.png"),
    Image.asset("assets/images/diet.png"),
    Image.asset("assets/images/pasta.png"),
    Image.asset("assets/images/roll.png"),



  ];
  List<String> text = [
    "Burgers",
    "Grocery",
    "Salads",
    "Sweets",
    "Utenlis",
    "Indian",
    "Pizza",
    "Chicken",
    "Diet",
    "Chinese",
    "Burritos"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Back",style:  GoogleFonts.inter(
          fontSize: 14,color: const Color(0xff292D32),
          fontWeight: FontWeight.w500 ),),),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("All Categories",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 36),),
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
                hintText: 'Search by Category',
                hintStyle: GoogleFonts.inter(fontSize: 17,fontWeight: FontWeight.w400,color: const Color(0xffB3BFCB)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            // height: 270,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: image.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisExtent: 120,mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      if(index == 0){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CategoryPage()));
                      }
                      if(index == 4){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const All_Utensils()));
                      }
                    },
                    child: Container(
                      // height: 103,
                      // width: 119,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xffEA985B).withOpacity(0.08)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 50,
                              width: 50,

                              child: image[index],),
                          ),
                          const SizedBox(height: 20,),
                          Text(text[index],style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14),)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],),
    );
  }
}