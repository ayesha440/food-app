import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JuicesWidget extends StatefulWidget {

   JuicesWidget({super.key,required this.image,required this.text,required this.value});
AssetImage image;
String text;
bool value;
  @override
  State<JuicesWidget> createState() => _JuicesWidgetState();
}

class _JuicesWidgetState extends State<JuicesWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
           SizedBox(height: 33,width: 43,child: Image(image: widget.image)),
          Text(widget.text, style: GoogleFonts.inter(fontSize:17,fontWeight: FontWeight.w400),),
          Spacer(),

          Radio(value: widget.value,
            activeColor: const Color(0xff292D32),
            groupValue: isSelected, onChanged: (value) {
              print('value $value');
              setState(() {
                isSelected = !isSelected;
              });
            },),
        ],),
    );
  }
}
