import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:medhya/auth/signup.dart';

import '../const.dart';
import '../services/authentication.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void SignIn() async {
    FirebaseAuthMethods(FirebaseAuth.instance).LoginWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
  }

  Widget _buildEmailRow() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Email or phone",
        hintStyle: TextStyle(color: Colors.black45),
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: Colors.black12,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8),
      ),
      style: TextStyle(fontSize: MediaQuery.of(context).size.height / 60),
      controller: _emailController,
    );
  }

  Widget _buildPasswordRow() {
    return TextField(
      decoration: InputDecoration(
        hintText: "password",
        hintStyle: TextStyle(color: Colors.black45),
        prefixIcon: Icon(Icons.lock_open),
        suffixIcon: Icon(Icons.remove_red_eye),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: Colors.black12,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8),
      ),
      style: TextStyle(fontSize: MediaQuery.of(context).size.height / 60),
      controller: _passwordController,
      obscureText: true,
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 55,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 0.8 * (MediaQuery.of(context).size.height / 20),
          width: 6 * (MediaQuery.of(context).size.width / 10),
          child: ElevatedButton(
           
            onPressed: SignIn,
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 7,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, 0),
              ),
              BoxShadow(
                blurRadius: 7,
                color: Colors.black12,
                offset: Offset(5, 0),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "welcome Back",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "sign in to continue",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: MediaQuery.of(context).size.height / 50),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              _buildEmailRow(),
              const SizedBox(
                height: 10,
              ),
              _buildPasswordRow(),
              _buildForgetPasswordButton(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              _buildLoginButton(),
              const SizedBox(
                height: 5,
              ),
              _buildSignUpBtn(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          },
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Dont have an account? ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  color: mainColor,
                  fontSize: MediaQuery.of(context).size.height / 60,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Image.asset("assets/images/#98E1F2.png"),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.35),
                    child: _buildContainer(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
