import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 50), // Add spacing for the status bar
            TabBar(
              labelStyle: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Sign Up'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LoginScreen(),
                  SignUpScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
