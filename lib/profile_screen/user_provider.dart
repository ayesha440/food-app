import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

import '../auth_screens/model/user_model.dart';
import '../model/user_model.dart';
class UserProvider with ChangeNotifier{
  UserModel? user;
  File? pickedFile;
  FirebaseStorage storage=FirebaseStorage.instance;
  pickImage(ImageSource  source)async{
    ImagePicker picker=ImagePicker();
    XFile? choosenImage = await picker.pickImage(source: source);

    if(choosenImage!=null){
      pickedFile=File(choosenImage.path);
      notifyListeners();
    }
  }

  Future<String> uploadFileToFirebase(File file,String path,String extension)async{
    String path=Uuid().v4();
    String downloadUrl='';
    await storage.ref(path).child('${path}.$extension').putFile(file).then((p0)async{
      downloadUrl=await p0.ref.getDownloadURL();
    });
    return downloadUrl;
  }

  Future<String> upload(File file,String extension)async{
    String randomId= Uuid().v4();
    String downloadUrl='';
    FirebaseStorage storage=FirebaseStorage.instance;
    await storage
        .ref()
        .child('users')
        .child("${randomId}.png")
        .putFile(file)
        .then((p0) async{
      downloadUrl =await p0.ref.getDownloadURL();
    });
    return downloadUrl;
  }
  File? imagefile;


  getUserData()async{
    DocumentSnapshot<Map<String, dynamic>>
    snapshot=await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    user=  UserModel.fromMap(snapshot.data()!);
    notifyListeners();
  }

  setUserNull(UserModel? user1){
    user=user1!;
    notifyListeners();
  }
}