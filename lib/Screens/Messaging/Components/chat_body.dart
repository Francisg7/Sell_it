import 'package:flutter/material.dart';
import 'package:sell_it/Models/ChatList.dart';
import 'package:sell_it/Models/ChatMessage.dart';
import 'package:sell_it/Screens/Messaging/Components/chat_card.dart';
import 'package:sell_it/Screens/Messaging/messages_screen.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: "Recent Messages",
                isFilled: true,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              FillOutlineButton(
                press: () {},
                text: "Online",
                isFilled: false,
              ),
            ],
          ),
        ),*/
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageScreen(
                      chat: chatsData[index],
                      messages: demoChatMessages,
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
