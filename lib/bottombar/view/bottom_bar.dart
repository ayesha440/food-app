
import 'package:flutter/material.dart';
import 'package:food_app/discovery_screen/view/discovery_screen.dart';
import 'package:food_app/drive_screen/drive_screen.dart';
import 'package:food_app/orders_screen/orders_screen.dart';
import 'package:food_app/profile_screen/profile_screen.dart';

import '../../home_screen/view/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/Bottombar';

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // static const routeName = '/Bottombar';


  int _page1 = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  // void dispose() {
  //   super.dispose();
  //   pageController.dispose();
  // }

  void onPageChanged(int page) {
    setState(() {
      _page1 = page;
    });
  }

  void navigationTapped(int page1) {
    pageController.jumpToPage(page1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics:  NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: [
         HomePage(),
          DiscoveryScreen(),
          DriveScreen(),
          OrdersScreen(),
          ProfileScreen()

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,


        onTap: navigationTapped,
        currentIndex: _page1,
        backgroundColor: Colors.white,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.disabled_visible),label: 'discovery'),
          BottomNavigationBarItem(icon: Icon(Icons.drive_eta_outlined),label: 'drive'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),label: 'orders'),
          BottomNavigationBarItem(icon: Image.asset("assets/images/profile.png"),label: 'profile'),




        ],
      ),
    );
  }
}