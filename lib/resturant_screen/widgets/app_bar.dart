
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/search_screen.dart';

AppBar buildAppBar(BuildContext context) { // Add BuildContext parameter
  return AppBar(

    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    shadowColor: Colors.white,
    surfaceTintColor: Colors.white,
    title: Text(
      "Back",
      style: GoogleFonts.inter(
        fontSize: 14,
        color: const Color(0xff292D32),
        fontWeight: FontWeight.w500,
      ),
    ),
    actions: [
      Container(
        height: 24,
        width: 24,
        child: InkWell(
          onTap: () {},
          child: Image.asset("assets/images/More.png"),
        ),
      ),
      const SizedBox(width: 20),
      Container(
        height: 24,
        width: 24,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
          },
          child: Image.asset("assets/images/Search Icon.png"),
        ),
      ),
      const SizedBox(width: 20),
      Container(
        height: 24,
        width: 24,
        child: InkWell(
          onTap: () {},

          child: Image.asset("assets/images/Cart.png"),
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}
