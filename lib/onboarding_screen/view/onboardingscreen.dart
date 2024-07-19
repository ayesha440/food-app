import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/auth_screens/view/auth_screen.dart';
import 'package:food_app/model/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                _buildOnboardingPage(
                  image: "assets/images/boardingpic1.jpeg",
                  title: "Wide range of Food Categories & more",
                  description: "Browse through our extensive list of restaurants and dishes, and when you're"
                      " ready to order, simply add your desired items to your cart and checkout."
                      " It's that easy!",
                ),
                _buildOnboardingPage(
                  image: "assets/images/b2.jpeg",
                  title: "Free Deliveries for One Month!",
                  description: "Get your favorite meals delivered to your doorstep for free with our online food delivery app - enjoy a whole month of complimentary delivery!"
                ),
                _buildOnboardingPage(
                  image: "assets/images/b3.jpeg",
                  title: "Get started on Ordering your Food",
                  description: "Please create an account or sign in to your existing account to start browsing our selection of delicious meals from your favorite restaurants.",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 20,top: 430),
            child: Row(
              children: List.generate(3, (index) => _buildDot(index)),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  _pageController.jumpToPage(2);
                },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Text("skip",style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: 20,
                      ),),
                    )),
                ElevatedButton(onPressed: (){
                  // var user = UserModel(name: "hello");
                  // print(user.name);
                  // user = user.copyWith(name: "Makki");
                  // print(user.name);
                  // dont add in the list
                  if (_currentPage < 2) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    // Navigate to the main screen
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthScreen()));
                  }
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffE47070),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Text(_currentPage == 2 ? "Continue" : "NEXT",style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage({required String image, required String title, required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 70),
        Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: GoogleFonts.inter(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 7,
      width: 7,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.orange : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}




class Person{
  final String name;

  Person({required this.name});
}