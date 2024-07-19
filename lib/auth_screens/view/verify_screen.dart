
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bottombar/view/bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class VerifyPhoneScreen extends StatefulWidget {
   VerifyPhoneScreen({super.key,this.isSignup=false ,required this.verificationId,required this.number,required this.name,required this.password});
  final String verificationId;
  final String name;
  final String number;
  final String password;
  bool isSignup;


  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  bool isloading = false;
  final TextEditingController pincontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('back',style: TextStyle(color: Colors.black,fontSize: 16),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Verify Phone Number",style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),),
            Text(
              'We have sent you a 6 digit code.',
              style: GoogleFonts.inter(fontSize: 14,color: Colors.black54),
            ),
            Text(
              'Please enter here to verify your number.',
              style: GoogleFonts.inter(fontSize: 14,color: Colors.black54),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '+923218353588',
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.black54 ),
                ),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Color(0xffFCE2CF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.edit,color: Colors.orange,size: 10,),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 60,
              child: Pinput(
                controller: pincontroller,
                disabledPinTheme:
                const PinTheme(decoration: BoxDecoration(color: Color(0xffEFF2F5))),
                length: 6,
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    var code = value;
                  });
                  print('$value changed');
                },
                onCompleted: (value) {
                  if (value != '123456') {
                    print('worng code');
                  } else {
                    print('$value, completed');
                  }
                },
                onSubmitted: (value) {
                  if (value != '123456') {
                    print('wrong code');
                  } else {
                    print('$value,submit');
                  }
                },
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Text("Didn’t Receive Code?",style: GoogleFonts.inter(color: Colors.black45,fontSize: 12),),
                  TextButton(onPressed: (){}, child: Text("Get a New one",style: GoogleFonts.inter(
                    color: Color(0xffF4739E),fontSize: 12
                  ),))
                ],
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: isloading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color(0xffffE47070)),
                      minimumSize:
                      const MaterialStatePropertyAll(Size(232, 58))),
                  onPressed: () async {
                    setState(() {
                      isloading = true;
                    });
                    try {
                      final cred = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: pincontroller.text);

                     if(widget.isSignup){
                       UserCredential  userCredentials =        await FirebaseAuth.instance
                           .signInWithCredential(cred);
                       FirebaseFirestore firestore =
                           FirebaseFirestore.instance;
                       await firestore
                           .collection('users')
                           .doc(userCredentials.user!.uid)
                           .set({
                         'uid': userCredentials.user!.uid,
                         'name': widget.name,
                         'phone': widget.number,
                         'password': widget.password,
                       });
                     }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBar()));
                    } catch (e) {
                      log(e.toString());
                    }
                    setState(() {
                      isloading = false;
                    });
                  },
                  child: Text(
                    "Verify",
                    style: GoogleFonts.inter(
                        color: const Color(0xffFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}