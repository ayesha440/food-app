import 'package:flutter/material.dart';

class CategoryCont extends StatelessWidget {
  CategoryCont({super.key, required this.name, required this.img});
  final String name;
  final String img;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding:  EdgeInsets.all(size.width*0.02),
      child: Container(
        height: size.height*0.15,
        width: size.width*0.3,
        decoration: BoxDecoration(
          color: Color(0xFFFCE2CF).withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
                width: size.width*0.3,
                child: Image.asset(img,height: size.height*0.1,)
            ),
            Text(name,style: TextStyle(
                color: Colors.black,fontSize: size.width*0.043,fontWeight: FontWeight.w600
            ),),
          ],
        ),
      ),
    );
  }
}



class NewCategories extends StatelessWidget {
  NewCategories({super.key, required this.name, required this.img, required this.avatar});
  final String name;
  final String img;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: size.height*0.15,
          width: size.width*0.6,
          margin: EdgeInsets.only(left:size.width*0.065),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image:  AssetImage(img),
                  fit: BoxFit.cover
              )
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: size.width*0.01,right:size.width*0.2 ),
          child: Row(
            children: [
              CircleAvatar(
                radius: size.width*0.04,
                backgroundImage: AssetImage(avatar),
              ),
              SizedBox(width: size.width*0.03,),
              Text(name),
            ],
          ),
        )
      ],
    );
  }
}


















