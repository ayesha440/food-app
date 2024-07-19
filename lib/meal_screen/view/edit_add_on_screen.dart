import 'package:flutter/material.dart';
import 'package:food_app/meal_screen/widget_juice.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAddOnScreen extends StatefulWidget {
  EditAddOnScreen({super.key});

  @override
  State<EditAddOnScreen> createState() => _EditAddOnScreenState();
}

class _EditAddOnScreenState extends State<EditAddOnScreen> {
  bool isSelected = false;
  // List of options

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Row(
                children: [
                  InkWell(onTap: (){Navigator.pop(context);},child: const Icon(Icons.arrow_back_rounded)),
                  const SizedBox(width: 10,),
                  Text(
                    "Western BBQ ... Meal",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xff292D32),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 390,
              height: 81,
              color: const Color(0xffEFF2F5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        Text("Drinks",style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 21,color: const Color(0xff000000)),),
                        Text("Edit Juice",style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16,color: const Color(0xff6A798A)),),
                      ],
                    ),
                    Text("Required",style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12,color: const Color(0xff28B996)),),
                  ],),
              ),
            ),
             SizedBox(height: 10,),
           JuicesWidget(image: AssetImage("assets/images/glass.png"), text: "Fruit Punch Juice", value: true),
            JuicesWidget(image: AssetImage("assets/images/orange.png"), text: "Orange Juice", value: true),
            JuicesWidget(image: AssetImage("assets/images/ginger.png"), text: "Ginger Shot Juice", value: true),
            JuicesWidget(image: AssetImage("assets/images/sweet.png"), text: "Sweet Guava Juice", value: true),
            JuicesWidget(image: AssetImage("assets/images/tomato.png"), text: "Tangy Tomato Juice", value: true),

             SizedBox(height: 150,),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                      backgroundColor: const MaterialStatePropertyAll(Color(0xff292D32)),
                      minimumSize: const MaterialStatePropertyAll(
                          Size(348, 50)
                      )
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Save",style: GoogleFonts.inter(color: const Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.w600),)),
            ),
          ],),
      ),
    );
  }
}