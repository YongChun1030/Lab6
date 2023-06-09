import 'package:firebase/screens/home/settings_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebase/screens/home/brew_list.dart';
import 'package:firebase/models/brew.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
      }

    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DatabaseService(uid: '').brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon:Icon(Icons.person),
              label: Text('logout'),
              onPressed: ()async{
                await _auth.signOut();
              },
              ),
            
            TextButton.icon(
              icon:Icon(Icons.settings),
              label: Text('settings'),
              onPressed:() => _showSettingPanel(),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BrewList()
        ),
      ),
    );
  }
}