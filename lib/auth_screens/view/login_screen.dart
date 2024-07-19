import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/auth_screens/view/verify_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../bottombar/view/bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
            Text("Welcome!",style: GoogleFonts.inter(
              fontSize: 27,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),),
            Text("Login to your account.",style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.black54,
            ),),
        
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Phone Number",style: GoogleFonts.inter(
                fontSize: 18,
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
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: phoneController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Phone Number',
                      hintStyle:  GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      enabledBorder: null,
                      border: InputBorder.none
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Password",style: GoogleFonts.inter(
                fontSize: 18,
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
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: passwordController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      hintStyle:  GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      enabledBorder: null,
                      border: InputBorder.none
                  ),
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(left: 180),
               child: TextButton(onPressed: (){}, child: Text("forget password?",style: TextStyle(
                 color: Colors.blue,
                 fontSize: 14,
        
               ),)),
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
                        if (
                            phoneController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          await auth.signInWithCredential(phoneAuthCredential);
                          // FirebaseFirestore firestore =
                          //    await FirebaseFirestore.instance;
                          // await firestore
                          //     .collection('users')
                          //     .doc(phoneAuthCredential!.verificationId)
                          //     .set({
                          //   'uid': phoneAuthCredential.verificationId,
                          //   'phone': phoneController.text,
                          //   'password': passwordController.text,
                          // });

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
                              builder: (context) => VerifyPhoneScreen(
                                number: '',
                                name: '',
                                password: '',
                                isSignup: false,
                                verificationId: verificationId,
                              ),
                            ));
                      },
                      codeAutoRetrievalTimeout: (verificationId) {
                        log("Auto Retireval timeout");
                      },
                    );
        
        
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.inter(
                        color: const Color(0xffFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
