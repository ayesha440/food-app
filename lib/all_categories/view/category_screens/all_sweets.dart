import 'package:flutter/material.dart';
import 'package:food_app/utensills_screens/Utensils_pro3.dart';
import 'package:food_app/utensills_screens/utensils_pro4.dart';

import '../../../utensills_screens/Utensils_pro1.dart';
import '../../../utensills_screens/Utensils_pro2.dart';



class AllSweets extends StatefulWidget {
  const AllSweets({super.key});

  @override
  State<AllSweets> createState() => _AllSweetsState();
}

class _AllSweetsState extends State<AllSweets> {
  final List<Product> _products = [
    Product(
      title: 'Ice Cream Cone Splash',
      imagePath: 'assets/images/ice-cream-cone-splash.png',
      price: '\$30.59',
    ),
    Product(
      title: 'Sweet Cupcake Desserts',
      imagePath: 'assets/images/sweet-cupcake-desserts.png',
      price: '\$33.90',
    ),
    Product(
      title: 'Lemon Curd Cake',
      imagePath: 'assets/images/Lemon-Curd-Cake.png',
      price: '\$51.90',
    ),
    Product(
      title: ' Chocolate Cupcake',
      imagePath: 'assets/images/delicious-chocolate-cupcake.png',
      price: '\$12.00',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_backspace),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.04),
                child: Text(
                  'Sweets',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.88,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.blueGrey.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        size: size.width * 0.06,
                        color: Colors.blueGrey.withOpacity(0.4),
                      ),
                      hintText: "Search Sweets",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.withOpacity(0.3),
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 600 ? 3 : 2,
                  crossAxisSpacing: size.width * 0.03,
                  mainAxisSpacing: size.height * 0.02,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {

                  return InkWell(
                      onTap: (){
                        if(index == 0){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Utensils_Pro1()));
                        }  if(index == 1){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Utensils_Pro2()));
                        }  if(index == 2){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Utensils_Pro3()));
                        }
                        if(index == 3){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Utensils_Product()));
                        }
                      },

                      child: _buildProductCard(_products[index], size));
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product, Size size) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: size.height*0.04),
            child: Center(
              child: Image.asset(
                product.imagePath,
                height: size.height * 0.12,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: size.height * 0.12,
                    color: Colors.grey,
                    child: Center(child: Text('Image not found')),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.04,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  product.price,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: size.width * 0.04,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String title;
  final String imagePath;
  final String price;

  Product({
    required this.title,
    required this.imagePath,
    required this.price,
  });
}
