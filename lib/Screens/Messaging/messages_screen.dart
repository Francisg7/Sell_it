import 'package:flutter/material.dart';
import 'package:sell_it/Screens/Messaging/Components/constants.dart';
import 'package:sell_it/Screens/Messaging/Components/message_body.dart';

class MessageScreen extends StatefulWidget {
  final String chatName;
  final List messages;

  const MessageScreen({Key key, this.chatName, this.messages})
      : super(key: key);
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
              backgroundImage: AssetImage(widget.chat.user.image),
            ),
            SizedBox(width: kDefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chat.user.firstName + " " + widget.chat.user.lastName,
                  style: TextStyle(fontSize: 16),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    widget.chat.user.lastSeen,
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
