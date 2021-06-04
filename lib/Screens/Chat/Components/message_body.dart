import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Models/ChatMessage.dart';
import 'package:sell_it/Screens/Chat/Components/constants.dart';

import 'message_input_field.dart';
import 'message_type_body.dart';

class MessageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Message(
                message: demeChatMessages[index],
              ),
            ),
          ),
        ),
        MessageInputField(),
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({Key key, @required this.message}) : super(key: key);

  final ChatMessage message;

  Widget messageContent(ChatMessage message) {
    switch (message.messageType) {
      case ChatMessageType.text:
        return TextMessage(message: message);
        break;
      case ChatMessageType.audio:
        return AudioMessage(message: message);
        break;
      case ChatMessageType.image:
        return ImageMessage(message: message);
        break;
      case ChatMessageType.video:
        return VideoMessage(message: message);
        break;
      default:
        return Text("unknown Message type");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: kDefaultPadding),
          padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding * 0.75),
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: messageContent(message),
        ),
        if (message.isSender) MessageStatusDot(status: message.messageStatus),
      ],
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus status;

  const MessageStatusDot({Key key, @required this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color messageDotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return Colors.redAccent;
          break;
        case MessageStatus.sending:
          return Colors.white;
          break;
        case MessageStatus.not_view:
          return Colors.white.withOpacity(0.2);
          break;
        case MessageStatus.viewed:
          return Colors.white;
          break;
        default:
          return Colors.transparent;
          break;
      }
    }

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          left: kDefaultPadding / 4, top: kDefaultPadding * 1.5),
      height: 14,
      width: 14,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent
            ? Icons.close
            : (status == MessageStatus.sending)
                ? Icons.access_time
                : Icons.done,
        size: 8,
        color: messageDotColor(status),
      ),
    );
  }
}
