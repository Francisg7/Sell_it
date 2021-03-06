import 'package:flutter/material.dart';
import 'package:sell_it/Screens/Messaging/Components/chat_body.dart';
import 'package:sell_it/Screens/Messaging/Components/constants.dart';

class ChatMainScreen extends StatelessWidget {
  static const String id = "ChatMainScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ChatBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.message),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(" Messages"),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
