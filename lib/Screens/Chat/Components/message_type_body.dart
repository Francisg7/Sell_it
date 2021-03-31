import 'package:audioplayers/audioplayers.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

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
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.audiotrack),
        onPressed: () async {
          await audioPlayer.play(
              "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_2MG.mp3");
        },
      ),
    );
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
