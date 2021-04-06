import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sell_it/Screens/Authentication/sign_in.dart';
import 'package:sell_it/Screens/Authentication/sign_up_page.dart';
import 'package:sell_it/Screens/Chat/chat_screen.dart';
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
      home: Initialisation(),
      initialRoute: Initialisation.id,
      routes: {
        Initialisation.id: (context) => Initialisation(),
        SignIn.id: (context) => SignIn(),
        SignUp.id: (context) => SignUp(),
        //HomePage.id: (context) => HomePage(),
        ChatMainScreen.id: (context) => ChatMainScreen(),
      },
    );
  }
}
