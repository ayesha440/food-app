import 'package:flutter/material.dart';

import 'colors.dart';


class AppFonts{
  static  TextStyle heading1=TextStyle(fontSize: 40,color: AppColors.textSecondaryColor,fontWeight: FontWeight.w900);

  static TextStyle customStyle({double? fontSize,Color? color,FontWeight? fontWeight}){
    return TextStyle(fontSize: fontSize??20,color: color??Colors.yellow,fontWeight: fontWeight?? FontWeight.w500);
  }
}