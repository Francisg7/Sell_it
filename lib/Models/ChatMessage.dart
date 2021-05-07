import 'package:flutter/material.dart';

enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, sending, not_view, viewed }

class ChatMessage {
  final String id;
  final String text;
  final String resource;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  final String datetime;

  ChatMessage({
    this.text,
    this.resource,
    @required this.datetime,
    @required this.id,
    @required this.messageType,
    @required this.messageStatus,
    @required this.isSender,
  });
}

List demoChatMessages = [
  ChatMessage(
    id: "1",
    text: "Hi Sajol,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    datetime: "19/10/1998",
  ),
  ChatMessage(
    id: "1",
    text: "Hello, How are you?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
    datetime: "19/10/1998",
  ),
  ChatMessage(
    id: "1",
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    datetime: "19/10/1998",
  ),
  ChatMessage(
    id: "1",
    text: "",
    messageType: ChatMessageType.image,
    messageStatus: MessageStatus.viewed,
    isSender: true,
    datetime: "19/10/1998",
  ),
  ChatMessage(
    id: "1",
    text: "Error happend",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
    datetime: "19/10/1998",
  ),
  ChatMessage(
    id: "1",
    text: "This looks great man!!",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    datetime: "19/10/1998",
  ),
  ChatMessage(
    id: "1",
    text: "Glad you like it",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
    datetime: "19/10/1998",
  ),
];
