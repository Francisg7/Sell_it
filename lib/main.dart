import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sell_it/Screens/Authentication/sign_in.dart';
import 'package:sell_it/Screens/Authentication/sign_up.dart';
import 'package:sell_it/Screens/Messaging/chat_screen.dart';

import 'Screens/Authentication/initialisation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      )),

      title: 'Flutter Demo',

      //home: SignIn(),
      initialRoute: Initialisation.id,
      routes: {
        Initialisation.id: (context) => Initialisation(),
        SignIn.id: (context) => SignIn(),
        SignUp.id: (context) => SignUp(),
        ChatMainScreen.id: (context) => ChatMainScreen(),
        //UserProfile.id: (context) => UserProfile(),
      },
    );
  }
}
