import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Utensils_Pro3 extends StatefulWidget {
  const Utensils_Pro3({super.key});

  @override
  State<Utensils_Pro3> createState() => _UtensilsState();
}

class _UtensilsState extends State<Utensils_Pro3> {
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
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Image.asset("assets/images/More.png"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Image.asset("assets/images/export.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(size.width * 0.07),
              child: Center(
                child: Image.asset(
                  'assets/images/U3.png',
                  height: size.height * 0.18,
                  width: size.width * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Circulon Matte Black Pan',
                    style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    children: [
                      Text(
                        'Brand:',
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.005),
                      Image.asset(
                        'assets/images/Ikea Logo.png',
                        height: size.height * 0.04,
                        width: size.width * 0.25,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Description',
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(onPressed: (){},
                            icon: Image.asset("assets/images/Minus.png")),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'You can easily turn the chopping board and use both sides when you prepare food, because it has easy-to-grip slanted edges. You can also use the chopping board as a serving...',
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width*0.7,
                        height: 62,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Color(0xff292D32)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(children: [
                            Image.asset("assets/images/bag.png"),
                            const SizedBox(width: 5,),
                            Text("Add to Bag", style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize:18,color: Color(0xffFFFFFF)),),
                            const SizedBox(width:40,),
                            Text("\$6.69", style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize:16,color: Color(0xff28B996)),),
                          ],),
                        ),
                      ),
                      Container(
                          height: 60,width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffFAD6D6),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Color(0xffE47070),))
                      )
                    ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
