import 'package:sell_it/Models/User.dart';

import 'User.dart';

class Chat {
  final User user;
  final String lastMessage;

  Chat({
    this.user,
    this.lastMessage, //not stored in firebase
  });
}

List chatsData = [
  Chat(
    user: new User(
        "1", "Jenny", "Wilson", 4.9, "3m ago", false, "Assets/images/user.png"),
    lastMessage: "Hope you are doing well...",
  ),
  Chat(
    user: new User("2", "Esther", "Howard", 4.0, "8m ago", true,
        "Assets/images/user_2.png"),
    lastMessage: "Hello Abdullah! I am...",
  ),
  Chat(
    user: new User("3", "Ralph", "Edwards", 4.2, "5d ago", false,
        "Assets/images/user_3.png"),
    lastMessage: "Do you have update...",
  ),
  Chat(
    user: new User(
        "4", "Jacob", "Jones", 3.9, "5d ago", true, "Assets/images/user_4.png"),
    lastMessage: "You’re welcome :)",
  ),
  Chat(
    user: new User("5", "Albert", "Flores", 4.5, "6d ago", false,
        "Assets/images/user_5.png"),
    lastMessage: "Thanks",
  ),
  Chat(
    user: new User(
        "6", "Jenny", "Wilson", 4.8, "3m ago", false, "Assets/images/user.png"),
    lastMessage: "Hope you are doing well...",
  ),
  Chat(
    user: new User("7", "Esther", "Howard", 4.2, "8m ago", true,
        "Assets/images/user_2.png"),
    lastMessage: "Hello Abdullah! I am...",
  ),
  Chat(
    user: new User("8", "Ralph", "Edwards", 4.6, "5d ago", false,
        "Assets/images/user_3.png"),
    lastMessage: "Do you have update...",
  ),
];
