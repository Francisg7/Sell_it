import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/constants.dart';
import 'package:sell_it/widgets/CustomNavigationBar.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.search,
          Icons.add,
          Icons.message,
          Icons.settings,
        ],
      onChange: (val){
          setState(() {
            _selectedItem = val;
          });
      },
        defaultSelectedIndex: 1,
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("SELL IT"),
        actions: [
          IconButton(
          icon: const Icon(Icons.notifications),
            tooltip: 'Notification',
             onPressed: () {}
          ),
          IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Notification',
              onPressed: () {}
          )

        ],
      ),
      body: Center(
        child: Text(
          "Hello from Item $_selectedItem",
          style: Constants.boldHeading,
        ),
      ),
          // body: Center(
          //   child: FlatButton(
          //     child: Text("Logout"),
          //     onPressed: (){
          //       FirebaseAuth.instance.signOut();
          //     },
          //   ),
          // ),
    );
  }
}
