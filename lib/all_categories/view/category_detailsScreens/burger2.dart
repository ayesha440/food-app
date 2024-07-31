import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../cart_screen/model/cart_item_model.dart';
import '../../../cart_screen/provider/cart_provider.dart';
import '../../../cart_screen/view/cart_screen.dart';

class Burger2 extends StatefulWidget {
  const Burger2({super.key});

  @override
  State<Burger2> createState() => _Burger2State();
}

class _Burger2State extends State<Burger2> {

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                },
                child: Image.asset("assets/images/bag.png",color: Colors.black.withOpacity(0.65),width: size.width*0.08,)),
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
                  'assets/images/Spaghetti_burger.png',
                  height: size.height * 0.2,
                  width: size.width * 0.55,
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
                    'Spaghetti full burger',
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
                      InkWell(
                        onTap:() async{
                          String cartid = Uuid().v4();
                          // _toggleCartItem();
                          CartItem newItem = CartItem(
                            id: cartid,
                            name: 'Spaghetti full burger',
                            price: 8.69,
                            quantity: 1,
                          );

                          // Call the function to add the item to the cart
                          // await addToCart(item);
                          Provider.of<CartProvider>(context, listen: false).addItem(newItem);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Item added to bag')),
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: isInCart?  Text('Item added to bag'):Text('Item remove from bag')),
                          );

                        },
                        child: Container(
                          width: size.width*0.7,
                          height: 62,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Color(0xff292D32)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: [
                              Image.asset("assets/images/bag.png"),
                              const SizedBox(width: 5,),
                              Text(
                                // isInCart ? "Remove from Bag" :
                                "Add to Bag",
                                style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize:13,color: Color(0xffFFFFFF)),),
                              const SizedBox(width:40,),
                               Text("\$6.69", style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize:14,color: Color(0xff28B996)),),
                            ],),
                          ),
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
