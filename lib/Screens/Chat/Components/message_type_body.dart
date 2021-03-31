import 'package:flutter/material.dart';
import 'package:sell_it/Models/ChatMessage.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({Key key, @required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message.text,
      style: TextStyle(
          color: message.isSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1.color),
    );
  }
}

class ImageMessage extends StatelessWidget {
  const ImageMessage({Key key, @required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        height: 200,
        width: 300,
        image: AssetImage("assets/images/jesus.png"),
      ),
    );
  }
}

class AudioMessage extends StatefulWidget {
  const AudioMessage({Key key, @required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  _AudioMessageState createState() => _AudioMessageState();
}

class _AudioMessageState extends State<AudioMessage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VideoMessage extends StatelessWidget {
  const VideoMessage({Key key, @required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
