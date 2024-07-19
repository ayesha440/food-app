import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBox extends StatelessWidget {
  const ItemBox({super.key});

  @override
  Widget build(BuildContext context) {
    var mheight=MediaQuery.of(context).size.height;
    var mwidth=MediaQuery.of(context).size.width;

    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,

        scrollDirection: Axis.horizontal,
        itemBuilder: (context ,index){
          return Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.black
            ),
            child: Text("hello"),
          );
        });
  }
}
