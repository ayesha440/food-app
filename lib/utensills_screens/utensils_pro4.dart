import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Utensils_Product extends StatefulWidget {
  const Utensils_Product({super.key});

  @override
  State<Utensils_Product> createState() => _UtensilsState();
}

class _UtensilsState extends State<Utensils_Product> {
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
            child: Image.asset("assets/images/more-square.png"),
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
                  'assets/images/Rectangle.png',
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
                    'Chopping Board from Ikea',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Color(0xFF292D32).withOpacity(0.9),
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.02,
                          ),
                          textStyle: TextStyle(fontSize: size.width * 0.045),
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/bag-happy.png"),
                            SizedBox(width: size.width * 0.02),
                            Text('Add to Bag',style: TextStyle(color: Colors.white),),
                            SizedBox(width: size.width * 0.05),
                            Text(
                              '\$12.00',
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF28B996)
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: size.width * 0.06),
                      IconButton(
                        onPressed: () {},
                        icon:  CircleAvatar(
                          backgroundColor:  Color(0xFFB3BFCB).withOpacity(0.5),
                          radius: size.width*0.07,
                          child: Icon(Icons.favorite,color: Colors.grey,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
