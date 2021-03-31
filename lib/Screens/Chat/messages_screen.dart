import 'package:flutter/material.dart';
import 'package:sell_it/Screens/Chat/Components/constants.dart';
import 'package:sell_it/Screens/Chat/Components/message_body.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackButton(),
            CircleAvatar(
              backgroundImage: AssetImage("Assets/images/user_2.png"),
            ),
            SizedBox(width: kDefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Name",
                  style: TextStyle(fontSize: 16),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    " last seen 5 min ago",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {},
          ),
          SizedBox(
            width: kDefaultPadding / 2,
          )
        ],
      ),
      body: MessageBody(),
    );
  }
}
