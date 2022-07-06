import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medhya/const.dart';

class HomePage extends StatelessWidget {
  final user = firebaseAuth.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "sign In as ",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            user!.email!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () => firebaseAuth.signOut(),
            child: const Text("SIGN OUT"),
          )
        ]),
      ),
    );
  }
}
