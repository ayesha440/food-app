import 'package:flutter/material.dart';
import 'package:food_app/all_categories/view/category_screens/all_burgers.dart';
import 'package:food_app/all_categories/view/category_screens/all_grocery.dart';
import 'package:food_app/all_categories/view/category_screens/all_salads.dart';
import 'package:food_app/all_categories/view/category_screens/all_sweets.dart';
import 'package:food_app/discovery_screen/view/current_location.dart';
import 'package:food_app/resturant_screen/providers/foodprovider.dart';
import 'package:food_app/utensills_screens/all_utensills.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../resturant_screen/view/kfc.dart';
import '../controller/hone_screen_controller.dart';
import '../../all_categories/view/all_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Image> image = [
    Image.asset('assets/images/bb.png'),
    Image.asset("assets/images/grocry.png"),
    Image.asset("assets/images/salad.png"),
    Image.asset("assets/images/Frame.png"),
    Image.asset("assets/images/tea.png"),
    Image.asset("assets/images/arrow.png"),
  ];
  List<String> text = [
    "Burgers",
    "Grocery",
    "Salads",
    "Sweets",
    "Utenlis",
    "See All",
  ];

  @override
  void initState() {
    Provider.of<Foodprovider>(context,listen: false).addRestaurent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05, right: size.height * 0.18),
              child: Text(
                "Good Evening",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.83,
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
                    prefixIcon: Icon(Icons.search,
                        size: 25, color: Colors.blueGrey.withOpacity(0.4)),
                    hintText: "Search Food, Restaurants etc.",
                    hintStyle: TextStyle(
                        color: Colors.blueGrey.withOpacity(0.3),
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCE2CF).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserCurrentLocation()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/location.png"),
                          Text(
                            "32, Kingston Ln.",
                            style: TextStyle(
                                color: Color(0xFFEA985B).withOpacity(0.7)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCE2CF).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/clock.png"),
                        Text(
                          "Order Now",
                          style: TextStyle(
                              color: Color(0xFFEA985B).withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.height * 0.24, top: 13),
              child: Text(
                "Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w600),
              ),
            ),

            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: image.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 120,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (index == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllCategoriesScreen()));
                            } else if (index == 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllBurgers()));
                            } else if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllGrocery()));
                            } else if (index == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AllSalad()));
                            } else if (index == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AllSweets()));
                            } else if (index == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const All_Utensils()));
                            } else if (index == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AllSweets()));
                            }
                          },
                          child: Container(
                            height: 103,
                            width: 119,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color:
                                    const Color(0xffEA985B).withOpacity(0.08)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: image[index],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  text[index],
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 1,
                  color: Color(0xffD5DEE7),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: size.height * 0.184),
              child: Text(
                "Offers Near you",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: size.height * 0.17,
                    width: size.width * 0.7,
                    margin: EdgeInsets.only(left: size.width * 0.03),
                    child: Image.asset("assets/images/3burger.png"),
                  ),
                  Container(
                    height: size.height * 0.17,
                    width: size.width * 0.7,
                    // margin: EdgeInsets.only(left:size.width*0.01),
                    child: Image.asset("assets/images/3burger.png"),
                  ),
                  Container(
                    height: size.height * 0.17,
                    width: size.width * 0.7,
                    margin: EdgeInsets.only(left: size.width * 0.02),
                    child: Image.asset("assets/images/3burger.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(right: size.height * 0.18),
              child: Text(
                "New & Trending",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Consumer<Foodprovider>(builder: (context, provider, child) {

              return SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.restarents.length,
                  itemBuilder: (context, index) {
                    var rest = provider.restarents[index];
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Kfc(
                                  restaurent: rest,
                                ),
                              ));
                        },
                        child: NewCategories(
                          name: rest.name,
                          img: rest.restaurentImage,
                          avatar: rest.logoImage,
                        ));
                  },
                ),
              );
            })
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //
            //   child: Row(
            //     children: [
            //       InkWell(
            //           onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Harveys(),));},
            //           child: NewCategories(name: "Hardees", img: "assets/images/3burger.png", avatar: "assets/images/hardeeslogo2.png",)),
            //       InkWell(
            //           onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Kfc(),));},
            //           child: NewCategories(name: "KFC", img: "assets/images/kfcimg.png", avatar: "assets/images/kfclogo.png",)),
            //       InkWell(
            //           onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Restaurant(),));},
            //           child: NewCategories(name: "McDonalds", img: "assets/images/meal.png", avatar: "assets/images/Logo.png",)
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
