import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/onboarding_screen/view/onboardingscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/profile_screen/user_provider.dart';
import 'package:food_app/resturant_screen/providers/foodprovider.dart';
import 'package:provider/provider.dart';
import 'bottombar/view/bottom_bar.dart';
import 'cart_screen/provider/cart_provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider(),),
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => Foodprovider()),


  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  BottomBar(),
      // home: FirebaseAuth.instance.currentUser!=null ? BottomBar(): OnboardingScreen(),
    );
  }
}
