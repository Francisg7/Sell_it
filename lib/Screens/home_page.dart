import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Authentication/initialisation.dart';
/*
class Homepage extends StatelessWidget {
  /// Widget's id name used with routes
  static const String id = "HomePage";

  /// Firebase User class element to store logged in user
  User user;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        title: 'SELL IT',
      ),
    );
  }
}
*/

class HomePage extends StatefulWidget {
  /// Widget's id name used with routes
  static const String id = "HomePage";
  final User user;

  const HomePage({Key key, @required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.email),
        backgroundColor: Colors.blueGrey.shade400,
        actions: [
          IconButton(
            icon: Icon(Icons.warning_amber_outlined),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              dispose();
              super.dispose();
              Navigator.pushNamed(context, Initialisation.id);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello, is your email address  ${widget.user.email} ? '),
          ],
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.blue,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: 'Search',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.add_circle_outline,
            label: 'Sell it',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.chat,
            label: 'Chat',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Settings',
            selectedBackgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
