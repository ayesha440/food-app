import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/meal_screen/view/meal_full_screen.dart';
import 'package:food_app/resturant_screen/view/search_screen.dart';
import 'package:food_app/resturant_screen/widgets/bottom_sheet_screem.dart';

class Restaurant extends StatelessWidget {
  const Restaurant ({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: InkWell(
                onTap: (){
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BottomSheetScreen();
                });},
                child: Image.asset("assets/images/More.png"))
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchScreen()));
                },
                child: Image.asset("assets/images/Search Icon.png"))
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: Image.asset("assets/images/Cart.png")
          ),
        ],

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: size.height*0.27,
              width: size.width*1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bb.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: size.width*0.03,horizontal:size.width*0.05 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: size.width*0.08,
                    backgroundImage: AssetImage("assets/images/Logo.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("McDonald's",style: TextStyle(
                          color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/location.png",color: Colors.black,),
                          Text(" Bramlea & Sandalwood",style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: size.width*0.03),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: size.width*0.05,),
                  CircleAvatar(
                    backgroundColor:  Color(0xFFB3BFCB).withOpacity(0.5),
                    radius: size.width*0.07,
                    child: Icon(Icons.favorite,color: Colors.grey,),
                  ),
                ],
              ),
            ),

            Container(
              height: size.height*0.17,
              width: size.width*0.85,
              decoration: BoxDecoration(
                color: Color(0xFFB3BFCB).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:size.width*0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: size.height*0.027,
                              width: size.width*0.06,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/star.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Ratings:"),
                            Text("4.5"),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: size.height*0.027,
                              width: size.width*0.06,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/box.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Delivers in "),
                            Text("15-20 min "),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: size.height*0.023,
                              width: size.width*0.05,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/redbox.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Burgers"),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MealFullScreen()));
                        },
                        child: CircleAvatar(
                          backgroundColor:  Colors.white.withOpacity(0.5),
                          radius: size.width*0.07,
                          child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: size.height*0.01),
                child: Container(
                  height: size.height*0.08,
                  decoration: BoxDecoration(
                    color: Color(0xFFB3BFCB).withOpacity(0.3),
                  ),
                  child: Row(
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Breakfast(),));
                      },
                        child:
                        Text("Breakfast Menu",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),),
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Lunch(),));
                          },
                          child: Text("Lunch & Dinner",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),)),
                      TextButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Restaurant(),));
                          },
                          child: Text("Overnight Menu",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),)),

                    ],
                  ),
                ),
              ),
            ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: EdgeInsets.only(left: size.height*0.02),
            //   child: Row(
            //
            //     children: [
            //       ElevatedButton(onPressed: (){},
            //         child:
            //         Text("Today's Deals",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),),
            //       ),
            //       SizedBox(width: size.width*0.03,),
            //       ElevatedButton(
            //           onPressed: (){},
            //           child: Text("Burger Meals",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),)),
            //       SizedBox(width: size.width*0.03,),
            //       ElevatedButton(
            //           onPressed:(){},
            //           child: Text("Chicken and Fish",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),)),
            //
            //     ],
            //   ),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  DealCont(img: "assets/images/b1.png", name: "Classic Cheese burger", weight: "(400 Cals)", price: "\$4.59"),
                  DealCont(img: "assets/images/b2.png", name: "Simply Cheese with Sesame", weight: "Seed Buns", price: "\$3.59"),
                  DealCont(img: "assets/images/b5.png", name: "Veggie & Bacon Hot Sauce  ", weight: "Sandwich", price: "\$5.59"),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
class DealCont extends StatelessWidget {
  DealCont({super.key, required this.img, required this.name, required this.weight, required this.price});

  @override
  final String img;
  final String name;
  final String weight;
  final String price;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
      Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:size.height*0.02,vertical:  size.height*0.01),
            child: Row(
              children: [
                Container(height: size.height*0.06,width:  size.height*0.14,child: Image(image: AssetImage(img))),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(
                        fontSize: 13,color:  Colors.black,
                        fontWeight: FontWeight.w600 ),),
                    Text((weight),style: TextStyle(
                        fontSize: 13,color:  Colors.black,
                        fontWeight: FontWeight.w600 ),),
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: size.width * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF28B996)
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(color: Colors.black12,),

        ],
      )
    ;
  }
}


//Lunch and dinner
class Lunch extends StatelessWidget {
  const Lunch ({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomSheetScreen();
                        });},
                  child: Image.asset("assets/images/More.png"))
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchScreen()));
                  },
                  child: Image.asset("assets/images/Search Icon.png"))
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: Image.asset("assets/images/Cart.png")
          ),
        ],

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: size.height*0.27,
              width: size.width*1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bb.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: size.width*0.03,horizontal:size.width*0.05 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: size.width*0.08,
                    backgroundImage: AssetImage("assets/images/Logo.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("McDonald's",style: TextStyle(
                          color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/location.png",color: Colors.black,),
                          Text(" Bramlea & Sandalwood",style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: size.width*0.03),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: size.width*0.05,),
                  CircleAvatar(
                    backgroundColor:  Color(0xFFB3BFCB).withOpacity(0.5),
                    radius: size.width*0.07,
                    child: Icon(Icons.favorite,color: Colors.grey,),
                  ),
                ],
              ),
            ),

            Container(
              height: size.height*0.17,
              width: size.width*0.85,
              decoration: BoxDecoration(
                color: Color(0xFFB3BFCB).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:size.width*0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: size.height*0.027,
                              width: size.width*0.06,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/star.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Ratings:"),
                            Text("4.5"),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: size.height*0.027,
                              width: size.width*0.06,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/box.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Delivers in "),
                            Text("15-20 min "),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: size.height*0.023,
                              width: size.width*0.05,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/redbox.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Burgers"),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MealFullScreen()));
                        },
                        child: CircleAvatar(
                          backgroundColor:  Colors.white.withOpacity(0.5),
                          radius: size.width*0.07,
                          child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: size.height*0.01),
                child: Container(
                  height: size.height*0.08,
                  decoration: BoxDecoration(
                    color: Color(0xFFB3BFCB).withOpacity(0.3),
                  ),
                  child: Row(
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Breakfast(),));
                      },
                        child:
                        Text("Breakfast Menu",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),),
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Lunch(),));
                          },
                          child: Text("Lunch & Dinner",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),)),
                      TextButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Restaurant(),));
                          },
                          child: Text("Overnight Menu",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),)),

                    ],
                  ),
                ),
              ),
            ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: EdgeInsets.only(left: size.height*0.02),
            //   child: Row(
            //
            //     children: [
            //       ElevatedButton(onPressed: (){},
            //         child:
            //         Text("Today's Deals",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),),
            //       ),
            //       SizedBox(width: size.width*0.03,),
            //       ElevatedButton(
            //           onPressed: (){},
            //           child: Text("Burger Meals",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),)),
            //       SizedBox(width: size.width*0.03,),
            //       ElevatedButton(
            //           onPressed:(){},
            //           child: Text("Chicken and Fish",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),)),
            //
            //     ],
            //   ),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  DealCont(img: "assets/images/Spaghetti_burger.png", name: "Spaghetti Burger", weight: "(400 Cals)", price: "\$4.59"),
                  DealCont(img: "assets/images/meal.png", name: "Simply Cheese burger", weight: "Meal", price: "\$3.59"),
                  DealCont(img: "assets/images/large.png", name: "Potato Fries with  ", weight: "Catchup", price: "\$5.59"),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}


//Breakfast menu
class Breakfast extends StatelessWidget {
  const Breakfast ({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomSheetScreen();
                        });},
                  child: Image.asset("assets/images/More.png"))
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchScreen()));
                  },
                  child: Image.asset("assets/images/Search Icon.png"))
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: Image.asset("assets/images/Cart.png")
          ),
        ],

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: size.height*0.27,
              width: size.width*1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bb.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: size.width*0.03,horizontal:size.width*0.05 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: size.width*0.08,
                    backgroundImage: AssetImage("assets/images/Logo.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("McDonald's",style: TextStyle(
                          color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/location.png",color: Colors.black,),
                          Text(" Bramlea & Sandalwood",style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: size.width*0.03),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: size.width*0.05,),
                  CircleAvatar(
                    backgroundColor:  Color(0xFFB3BFCB).withOpacity(0.5),
                    radius: size.width*0.07,
                    child: Icon(Icons.favorite,color: Colors.grey,),
                  ),
                ],
              ),
            ),

            Container(
              height: size.height*0.17,
              width: size.width*0.85,
              decoration: BoxDecoration(
                color: Color(0xFFB3BFCB).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:size.width*0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: size.height*0.027,
                              width: size.width*0.06,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/star.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Ratings:"),
                            Text("4.5"),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: size.height*0.027,
                              width: size.width*0.06,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/box.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Delivers in "),
                            Text("15-20 min "),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: size.height*0.023,
                              width: size.width*0.05,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/redbox.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text(" Burgers"),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MealFullScreen()));
                        },
                        child: CircleAvatar(
                          backgroundColor:  Colors.white.withOpacity(0.5),
                          radius: size.width*0.07,
                          child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: size.height*0.01),
                child: Container(
                  height: size.height*0.08,
                  decoration: BoxDecoration(
                    color: Color(0xFFB3BFCB).withOpacity(0.3),
                  ),
                  child: Row(
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Breakfast(),));
                      },
                        child:
                        Text("Breakfast Menu",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),),
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Lunch(),));
                          },
                          child: Text("Lunch & Dinner",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),)),
                      TextButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Restaurant(),));
                          },
                          child: Text("Overnight Menu",style: TextStyle (fontSize: size.width*0.04,color: Colors.black),)),

                    ],
                  ),
                ),
              ),
            ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: EdgeInsets.only(left: size.height*0.02),
            //   child: Row(
            //
            //     children: [
            //       ElevatedButton(onPressed: (){},
            //         child:
            //         Text("Today's Deals",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),),
            //       ),
            //       SizedBox(width: size.width*0.03,),
            //       ElevatedButton(
            //           onPressed: (){},
            //           child: Text("Burger Meals",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),)),
            //       SizedBox(width: size.width*0.03,),
            //       ElevatedButton(
            //           onPressed:(){},
            //           child: Text("Chicken and Fish",style: TextStyle (fontSize: size.width*0.033,color: Colors.black),)),
            //
            //     ],
            //   ),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  DealCont(img: "assets/images/avocada_salad.png", name: "Avocada Salad", weight: "(1 plate)", price: "\$4.59"),
                  DealCont(img: "assets/images/Lemon-Curd-Cake.png", name: "Lemon Curd Cake", weight: "Seed Buns", price: "\$3.59"),
                  DealCont(img: "assets/images/Dosa-with-chuttni.png", name: "Dosa with Chuttni ", weight: "(1 plate)", price: "\$5.59"),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}

