import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Models/ChatMessage.dart';
import 'package:sell_it/Models/User.dart';
import 'package:sell_it/Screens/Messaging/Components/chat_card.dart';
import 'package:sell_it/Screens/Messaging/messages_screen.dart';

class ChatBody extends StatefulWidget {
  final User user;
  const ChatBody({Key key, this.user}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference chatList = FirebaseFirestore.instance
        .collection('users')
        .doc('${widget.user.id}')
        .collection('chatList');

    return FutureBuilder(
        future: chatList.doc('list').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => ChatCard(
                      chatName: data['chats'][index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessageScreen(
                              chatName: data['chats'][index],
                              messages: demoChatMessages,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            );
          }

          return Text("loading");
        });
  }
}
