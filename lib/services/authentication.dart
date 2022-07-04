import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medhya/auth/signin.dart';
import 'package:medhya/homepage.dart';

import '../const.dart';

class FirebaseAuthMethods extends GetxController {

 late Rx<User?> _user;

 @override
 void onReady(){
  super.onReady();
  _user = Rx<User?>(firebaseAuth.currentUser);
  _user.bindStream(firebaseAuth.authStateChanges());
  ever(_user,_setInitialScreen);
 }

 _setInitialScreen(User? user){
   if(user == null){
    Get.offAll(() => SignIn());
   }
   else{
     Get.offAll(() => HomePage());
   }
 }

  static FirebaseAuthMethods instance  = Get.find();

  Future<void> signUpWithEmail(
      String email,
       String password,
      ) async {
        try{
          await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        }catch(e){
          Get.snackbar("error creating an account", e.toString(),);
        }
      }
  Future<void> LoginWithEmail(
   String email,
   String password,
   
  ) async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      
    } catch(e){
      Get.snackbar("error creating an account", e.toString(),);
    }
  }
}
