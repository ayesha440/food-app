import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/auth_screens/view/login_screen.dart';
import 'package:food_app/auth_screens/view/verify_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../bottombar/view/bottom_bar.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode node = FocusNode();
  final FocusNode celnode = FocusNode();
  final FocusNode pasnode = FocusNode();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  bool isFocused = false;
  bool iscelFocused = false;
  bool ispasFocused = false;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome!",style: GoogleFonts.poppins(
              fontSize: 27,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),),
            Text("Sign up to your account.",style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.black54,
            ),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("First Name",style: GoogleFonts.inter(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffEFF2F5),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  focusNode: node,
                  controller: firstNameController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        isFocused = true;
                      });
                    } else {
                      setState(() {
                        isFocused = false;
                      });
                    }
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffB3BFCB)),

                  border: InputBorder.none,
                    suffixIcon: isFocused
                        ? InkWell(
                        onTap: () {
                          firstNameController.text = '';
                        },
                        child: Icon(Icons.cancel))
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Phone Number",style: GoogleFonts.inter(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffEFF2F5),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,),
                child:PhoneFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffEFF2F5),

                    contentPadding: const EdgeInsets.only(top: 17),
                   border: InputBorder.none,
                  ),
                  initialValue: PhoneNumber.parse('+33'),
                  countrySelectorNavigator: const CountrySelectorNavigator.page(),
                  onChanged: (phoneNumber) {
                    phoneController.text =
                    '+${phoneNumber.countryCode}${phoneNumber.nsn}';
                  },
                  enabled: true,
                  isCountrySelectionEnabled: true,
                  isCountryButtonPersistent: true,
                  countryButtonStyle: const CountryButtonStyle(
                      showDialCode: true,
                      showIsoCode: true,
                      showFlag: true,
                      flagSize: 16),
                ),

              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Create Password",style: GoogleFonts.inter(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffEFF2F5),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,),
                child:TextField(
                  cursorColor: Colors.black,
                  controller: passwordController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        ispasFocused = true;
                      });
                    } else {
                      setState(() {
                        ispasFocused = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffB3BFCB)),
                    border: InputBorder.none,
                    enabledBorder: null,
                    suffixIcon: ispasFocused
                        ? InkWell(
                        onTap: () {
                          passwordController.text= '';
                        },
                        child: Icon(Icons.cancel))
                        : null,
                  ),
                ),

              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                    child: Divider(
                      color: Color(0xffD5DEE7),
                      height: 1,
                      indent: 10,
                      endIndent: 10,
                    )),
                Text(
                  "hungry? let's continue with these",
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff6A798A)),
                ),
                const Expanded(
                    child: Divider(
                      color: Color(0xffD5DEE7),
                      height: 10,
                      indent: 5,
                      endIndent: 10,
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: ()async{
                      final GoogleSignIn gSignIn=GoogleSignIn();
                      try{
                        final GoogleSignInAccount? gSignInAccount=await gSignIn.signIn();
                        if(gSignInAccount !=null){
                          final GoogleSignInAuthentication gSignInAuth=await gSignInAccount.authentication;
                          final AuthCredential credential=GoogleAuthProvider.credential(
                            idToken: gSignInAuth.idToken,
                            accessToken: gSignInAuth.accessToken,
                          );
                          final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
                          await _firebaseAuth.signInWithCredential(credential);
                          final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

                          // Get the signed-in user
                          final User? user = userCredential.user;
                          print("Signed in as ${user?.displayName}");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BottomBar()));

                        }
                      }catch(e){
                        log(e.toString());
                      }
                    },
                    child: Container(
                      height: 50,width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffD5DEE7)),

                      ),
                      child: Image.asset("assets/images/g.png"),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffD5DEE7)),

                      ),
                      child: Image.asset("assets/images/a.png"),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffD5DEE7)),

                      ),
                      child: Image.asset("assets/images/fb.png"),
                    ),
                  ),
                ],
              ),
            ),

           SizedBox(height: 60,),
            Align(
              alignment: Alignment.center,
              child:ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                      const MaterialStatePropertyAll(Color(0xffffE47070)),
                      minimumSize:
                      const MaterialStatePropertyAll(Size(232, 58))),
                  onPressed: () async {
                    setState(() {
                      isloading = true;
                    });
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneController.text,
                      verificationCompleted: (phoneAuthCredential) async{
                        if (firstNameController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          UserCredential userCredentials=      await auth.signInWithCredential(phoneAuthCredential);
                              // if(userCredentials.additionalUserInfo.isNewUser){

                        }
                      },
                      verificationFailed: (error) {
                        log(error.toString());
                      },
                      codeSent: (verificationId, forceResendingToken) {
                        setState(() {
                          isloading = false;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyPhoneScreen(isSignup: true,
                                verificationId: verificationId, number: phoneController.text, name: firstNameController.text, password: passwordController.text,
                              ),
                            ));
                      },
                      codeAutoRetrievalTimeout: (verificationId) {
                        log("Auto Retireval timeout");
                      },
                    );


                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.inter(
                        color: const Color(0xffFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
            )

          ],
        ),
      ),
    );
  }
}
