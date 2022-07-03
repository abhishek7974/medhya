import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../const.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
        try{
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
        }on FirebaseAuthException catch(e){
          showSnackBar(context, e.message!);
        }
      }
  Future<void> LoginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      
    }on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
    }
  }
}
