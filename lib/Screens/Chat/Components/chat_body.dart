import 'package:chat/screens/chat/messages_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/filled_outline_button.dart';
import '../../../constants.dart';
import '../../../models/Chat.dart';
import 'chat_card.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageScreen(),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
