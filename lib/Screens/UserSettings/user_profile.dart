import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
      ),
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
                  child: Text("Description", style: TextStyle(fontSize: 14)),
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
                  child: Text("Description", style: TextStyle(fontSize: 14)),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      onLongPress: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Initialisation()),
                        );
                        await FirebaseAuth.instance.signOut();
                        dispose();
                      },
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
    //var image = await ImagePicker
    var image = await ImagePicker.pickImage();
  }
}
