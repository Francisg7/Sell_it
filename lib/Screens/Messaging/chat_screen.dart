import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/Messaging/Components/chat_body.dart';
import 'package:sell_it/Screens/Messaging/Components/constants.dart';

class ChatMainScreen extends StatefulWidget {
  final User user;
  static const String id = "ChatMainScreen";

  const ChatMainScreen({Key key, this.user}) : super(key: key);

  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ChatBody(widget.user),
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
