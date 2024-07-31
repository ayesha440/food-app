import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/onboarding_screen/view/onboardingscreen.dart';
import 'package:food_app/profile_screen/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName='profile';
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  bool _obscureText = true;
  File? imagefile;
  @override
  Widget build(BuildContext context) {
    var currentUser=Provider.of<UserProvider>(context,listen: false).getUserData();
    return  Container(
      child: Scaffold(
        body: SingleChildScrollView(child:
        Consumer<UserProvider>(
            builder: (context,userPro,_) {
              final user = userPro.user;
              final imageUrl = user?.imageUrl ?? '';
              final firstName = user?.firstName ?? 'Unknown';
              final phone = user?.phone ?? 'Unknown';
              return Column(
                children: [
                  InkWell(
                      onTap: ()async{
                        Provider.of<UserProvider>(context,listen: false).pickImage(ImageSource.gallery);
                        String url= await Provider.of<UserProvider>(context,listen: false)
                            .upload(userPro.pickedFile!,'jpg');
                        await FirebaseFirestore.instance.collection('users').doc(userPro.user!.uid).set({
                          'imageUrl':url
                        });


                      },
                      child:CircleAvatar(
                        radius: 65,
                        backgroundImage: userPro.user!.imageUrl.isNotEmpty? NetworkImage(userPro.user!.imageUrl) :
                        NetworkImage(
                            "https://i.pinimg.com/474x/b8/29/22/b82922d1490bc3f10c3ed99683ea68c2.jpg"
                        ),
                      )

                  ),
                  SizedBox(height: 30,),

                  Text(userPro.user!.firstName,style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(height: 30,),

                  Text(userPro.user!.phone.toString()),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.lock,color: Colors.red,),
                        title: Text("Change Password"),
                        onTap: (){},
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child:ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                            backgroundColor:
                            const MaterialStatePropertyAll(Color(0xffffE47070)),
                            minimumSize:
                            const MaterialStatePropertyAll(Size(232, 58))
                        ),
                        onPressed: () async {
                          FirebaseAuth auth=FirebaseAuth.instance;
                         await auth.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => OnboardingScreen()));

                        },
                        child: Text(
                          "Logout",
                          style: GoogleFonts.inter(
                              color: const Color(0xffFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                  ),

                ],
              );
            }
        ),


        ),
      ),
    );
  }
}
