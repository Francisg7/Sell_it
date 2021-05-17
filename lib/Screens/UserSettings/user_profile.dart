import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/Authentication/initialisation.dart';

class UserProfile extends StatefulWidget {
  static const String id = "UserProfile";
  final User user;
  const UserProfile({Key key, @required this.user}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Profile"),
          actions: [
            //IconButton(onPressed: gotoEdit(), icon: Icon(Icons.settings))
          ]),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("Assets/images/default_user.png"),
                  backgroundColor: Colors.grey[200],
                  radius: 100.0,
                ),
                Positioned(
                  child: CircleAvatar(
                    child: IconButton(
                      icon: Icon(Icons.auto_fix_high),
                      color: Colors.white,
                      onPressed: () {
                        pickImage();
                      },
                    ),
                    backgroundColor: Colors.grey[500],
                  ),
                  bottom: 0,
                  right: 0,
                )
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      Text("Name",
                          style: TextStyle(
                              letterSpacing: 3,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Template Name", style: TextStyle(fontSize: 14)),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wysiwyg),
                      Text(
                        "Description",
                        style: TextStyle(
                            letterSpacing: 3,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("This is a template description of the user.",
                      style: TextStyle(fontSize: 14)),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                      onPressed: () {}, //logout(),
                      child: Text("Logout", style: TextStyle(fontSize: 14))),
                ),
                SizedBox(height: 20.0),
              ],
            )
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    File image;
    //var image = await ImagePicker
    //image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Initialisation()));
    dispose();
  }

  /*gotoEdit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserProfileEdit()));
  }*/
}
