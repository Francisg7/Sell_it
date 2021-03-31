import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

class MessageInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding / 3,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: kPrimaryColor.withOpacity(0.14)),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.65),
                    ),
                    SizedBox(
                      width: kDefaultPadding / 3,
                    ),
                    Icon(
                      Icons.photo_camera_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.65),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding / 4),
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              child: Icon(Icons.mic, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
