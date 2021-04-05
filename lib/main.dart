import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sell_it/Screens/Authentication/login.dart';
import 'package:sell_it/Screens/Authentication/register_page.dart';
import 'package:sell_it/Screens/Chat/chat_screen.dart';
import 'package:sell_it/Screens/home.dart';

import 'Screens/Authentication/landing_page.dart';

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
      home: LandingPage(),
      initialRoute: LandingPage.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        Homepage.id: (context) => Homepage(),
        ChatMainScreen.id: (context) => ChatMainScreen(),
      },
    );
  }
}
