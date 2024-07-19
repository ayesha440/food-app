import 'package:flutter/material.dart';

import 'app_font.dart';
import 'colors.dart';

class DeliveryItem extends StatefulWidget {
  final String text;
  final String text1;
  final String text2;
  const DeliveryItem({super.key,required this.text,required this.text1,required this.text2});

  @override
  State<DeliveryItem> createState() => _DeliveryItemState();
}

class _DeliveryItemState extends State<DeliveryItem> {
  bool isChecked = false;
  int selected=1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                selected=1;
              });
            },
            child: Container(
              height: 40,
              width: 148,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: selected==1?AppColors.primaryColor.withOpacity(0.7):AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: AppColors.whiteColor,
                      width: 2
                  )
              ),
              child: Text(widget.text,style: AppFonts.customStyle(color: selected==1?AppColors.whiteColor:AppColors.blackColor,fontSize: 12),),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                selected=2;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 148,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: selected==2?AppColors.primaryColor.withOpacity(0.7):AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: AppColors.whiteColor,
                        width: 2
                    )
                ),
                child: Text(widget.text1,style: AppFonts.customStyle(color: selected==2?AppColors.whiteColor:AppColors.blackColor,fontSize: 12),),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                selected=3;
              });
            },
            child: Container(
              height: 40,
              width: 148,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: selected==3?AppColors.primaryColor.withOpacity(0.7):AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: AppColors.whiteColor,
                      width: 2
                  )
              ),
              child: Text(widget.text2,style: AppFonts.customStyle(color: selected==3?AppColors.whiteColor:AppColors.blackColor,fontSize: 12),),
            ),
          ),
        ],
      ),
    );
  }
}