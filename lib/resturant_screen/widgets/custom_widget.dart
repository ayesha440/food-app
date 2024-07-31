import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../favourite_screen/provider/fav_provider.dart';
import '../../favourite_screen/view/fav_screen.dart';
class CustomResturantLogoWidget extends StatelessWidget {
   final String logoImage;
   final String resturantNmae;
   final String locationNmae;

   CustomResturantLogoWidget({super.key,required this.locationNmae,required this.logoImage,required this.resturantNmae});
  List<Map<String, dynamic>> products = [
    {'id': 'prod1', 'name': "McDonald's", 'location':'Bramlea & Sandalwood','image':"assets/images/Logo.png" },
    {'id': 'prod2', 'name': "KFC", 'location':'Bramlea & Sandalwood','image':"assets/images/kfclogo.png" }, // Example valid URL
    {'id': 'prod3', 'name': "Harveys", 'location':'Bramlea & Sandalwood','image':"assets/images/hlogo.png" }, // Example valid URL
  ];

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: size.width*0.03,horizontal:size.width*0.05 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: size.width*0.08,
            backgroundImage: AssetImage(logoImage),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(resturantNmae,style: TextStyle(
                  color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/location.png",color: Colors.black,),
                  Text(locationNmae,style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: size.width*0.03),)
                ],
              ),
            ],
          ),
          SizedBox(width: size.width*0.05,),
          Consumer<FavoriteProvider>(
              builder: (context, favoriteProvider, child) {
                final isFavorite = favoriteProvider.favoriteProducts.isNotEmpty;

                return CircleAvatar(
                  backgroundColor:  isFavorite ? Color(0xffFAD6D6): Color(0xFFB3BFCB).withOpacity(0.5),
                  radius: size.width*0.07,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FavoriteScreen()));
                    },
                    child:
                    Consumer<FavoriteProvider>(
                      builder: (context, favoriteProvider, child) {
                        return ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            final productId = product['id']!;
                            final name = product['name']!;
                            final imageUrl = product['image']!;
                            final location = product['location']!;

                            final isFavorite = favoriteProvider.favoriteProducts.any((fav) =>
                            fav.productId == productId);

                            return  IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite,
                                color: isFavorite ? Color(0xffE47070) : Color(0xff6A798A),
                              ),
                              onPressed: () {
                                debugPrint("product Id $productId");
                                // favoriteProvider.toggleFavorite(productId, name,location, imageUrl);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),);
              }
          ),
        ],
      ),
    );
  }
}
// Padding(
// padding: EdgeInsets.symmetric(vertical: size.width*0.03,horizontal:size.width*0.05 ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// CircleAvatar(
// radius: size.width*0.08,
// backgroundImage: AssetImage("assets/images/kfclogo.png"),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("KFC ",style: TextStyle(
// color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
// ),),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset("assets/images/location.png",color: Colors.black,),
// Text(" Bramlea & Sandalwood",style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: size.width*0.03),)
// ],
// ),
// ],
// ),
// SizedBox(width: size.width*0.05,),
// CircleAvatar(
// backgroundColor:  Color(0xFFB3BFCB).withOpacity(0.5),
// radius: size.width*0.07,
// child: Icon(Icons.favorite,color: Colors.grey,),
// ),
// ],
// ),
// ),