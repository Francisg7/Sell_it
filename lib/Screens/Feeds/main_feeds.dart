import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/Authentication/initialisation.dart';
import 'package:sell_it/Screens/Messaging/Components/chat_body.dart';
import 'package:sell_it/Screens/UserSettings/user_profile.dart';

class MainFeedsPage extends StatefulWidget {
  static const String id = "HomePage";
  final User user;
  const MainFeedsPage({Key key, @required this.user}) : super(key: key);

  @override
  _MainFeedsPageState createState() => _MainFeedsPageState();
}

class _MainFeedsPageState extends State<MainFeedsPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Add',
      style: optionStyle,
    ),
    ChatBody()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello  ${widget.user.email}",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 20.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.warning_amber_outlined,
              color: Colors.black,
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Initialisation()),
              );
              await FirebaseAuth.instance.signOut();
              dispose();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfile(user: widget.user)),
              );
            },
          ),
          PopupMenuButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onSelected: (value) {
                print("This has been selected" + value);
              },
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: null,
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text("User"),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: "Link" /*(){print("link button pressed");}*/,
                      child: ListTile(
                        leading: const Icon(Icons.link),
                        title: Text("Get Link"),
                      ),
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem<String>(
                      value: null,
                      child: ListTile(
                        leading: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        title: Text(
                          "Delete",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ])
        ],
      ),
      body: Center(
        child: Container(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
            //backgroundColor: Colors.yellow,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FloatingActionButton Pressed");
        },
        elevation: 5,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
