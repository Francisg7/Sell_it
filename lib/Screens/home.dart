import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/services/firebase_services.dart';
import 'package:sell_it/tabs/chat_tab.dart';
import 'package:sell_it/tabs/home_tab.dart';
import 'package:sell_it/tabs/save_tab.dart';
import 'package:sell_it/tabs/search_tab.dart';
import 'package:sell_it/widgets/Button_tabs.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseServices _firebaseServices =FirebaseServices();
  PageController _tabPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabPageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded(
                child: PageView(
                  controller: _tabPageController,
                  onPageChanged: (num){
                    setState(() {
                      _selectedTab = num;
                    });
                  },
                  children: [
                    HomeTab(),
                    SearchTab(),
                    SearchTab(),
                    ChatTab(),
                    SaveTab(),
                  ],
                  //AssetImage('assets/'),
                ),
              ),
            BottomTabs(
              selectedTab: _selectedTab,
              tabPressed: (num){
                setState(() {
                  _tabPageController.animateToPage(
                      num,
                      duration: Duration(
                        milliseconds: 300
                      ),
                      curve: Curves.easeOutCubic);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}