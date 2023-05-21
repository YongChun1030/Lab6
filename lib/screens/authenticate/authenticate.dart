import 'package:flutter/material.dart';
import 'package:firebase/screens/authenticate/sign_in.dart';
import 'package:firebase/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

   void toggleView() { 
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}