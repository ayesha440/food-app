import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/fav_provider.dart';
import 'package:http/http.dart' as http;


class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
     Provider.of<FavoriteProvider>(context,listen: false).loadFavorites();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products'),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          final favoriteProducts = favoriteProvider.favoriteProducts;

          if (favoriteProducts.isEmpty) {
            return Center(child: Text('No favorite products.'));
          }

          return ListView.builder(
            itemCount: favoriteProvider.favoriteProducts.length,
            itemBuilder: (context, index) {
              final productId = favoriteProducts[index];
              // Container(
              //   height: 100,
              //   width: 100,
              //   child: Image.asset(favoriteProvider.favoriteProducts[index].imageUrl),
              // );
              return  Padding(
                padding: EdgeInsets.symmetric(vertical: size.width*0.03,horizontal:size.width*0.05 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: size.width*0.08,
                      backgroundImage: AssetImage(favoriteProvider.favoriteProducts[index].imageUrl),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(favoriteProvider.favoriteProducts[index].name,style: TextStyle(
                            color: Colors.black,fontSize: size.width*0.06,fontWeight: FontWeight.bold
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/location.png",color: Colors.black,),
                            Text("Bramlea & Sandalwood",style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: size.width*0.03),)
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
                              child: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite,
                                  color: isFavorite ? Color(0xffE47070) : Color(0xff6A798A),
                                ),


                            ),);
                        }
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
