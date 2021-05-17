import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  BottomTabs({this.selectedTab, this.tabPressed});

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 0;


  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0 ;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabsBtn(
           imagePath: "Assets/tab_home.png",
            selected: _selectedTab == 0 ? true: false,
            onPressed: (){
              widget.tabPressed(0);
            },
          ),
          BottomTabsBtn(
            imagePath: "Assets/tab_search.png",
            selected: _selectedTab == 1 ? true: false,
            onPressed: (){
             widget.tabPressed(1);
            },
          ),
          BottomTabsBtn(
            imagePath:"Assets/tab_add.png",
            selected: _selectedTab == 2 ? true: false,
            onPressed: (){
              widget.tabPressed(2);
            },
          ),
          BottomTabsBtn(
            imagePath: "Assets/tab_chat.png",
            selected: _selectedTab == 3 ? true: false,
            onPressed: (){
              widget.tabPressed(3);
            },
          ),
          BottomTabsBtn(
            imagePath: "Assets/tab_save.png",
            selected: _selectedTab == 4 ? true: false,
            onPressed: (){
              widget.tabPressed(4);
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabsBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  BottomTabsBtn({this.imagePath, this.selected, this.onPressed});
  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 28.0,
          horizontal: 20.0
        ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: _selected ? Theme.of(context).accentColor: Colors.transparent,
                width: 2.0,
              )
            )
          ),
          child: Image (
            image: AssetImage(
              imagePath ?? "Assets/tab_home.png",
            ),
            height: 30.0,
            width:25.0 ,
            color: _selected ? Theme.of(context).accentColor: Colors.black,
          ),
      ),
    );
  }
}
