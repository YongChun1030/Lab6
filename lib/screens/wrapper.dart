import 'package:firebase/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase/models/user.dart';

//import 'package:brew_crew/models/user.dart';
//import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

     final user = Provider.of<MyUser?>(context);
     print(MyUser);

    
    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}