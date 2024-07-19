import 'package:flutter/material.dart';
final List<GlobalKey> keys = [
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
];

Widget buildCategoryTitle(String title,int index){
  return  Padding(
    key: keys[index],
    padding:  const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 19,fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ],),
  );
}