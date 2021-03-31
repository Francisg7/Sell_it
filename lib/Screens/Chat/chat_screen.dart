import 'package:chat/screens/chat/Components/chat_body.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../constants.dart';
import '../../constants.dart';

class ChatMainScreen extends StatelessWidget {
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
