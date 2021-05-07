import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sell_it/Constants/text_style_constants.dart';
import 'package:sell_it/Screens/Authentication/sign_up.dart';
import 'package:sell_it/Screens/Feeds/main_feeds.dart';
import 'package:sell_it/Widgets/alert_dialog_widget.dart';
import 'package:sell_it/Widgets/button_widget.dart';
import 'package:sell_it/Widgets/input_field_widget.dart';
//import 'package:firebase_core/firebase_core.dart';

class SignIn extends StatefulWidget {
  static const String id = "SignInPage";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _registerEmail = "";
  String _registerPassword = "";
  bool _loading = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    "Login to your Account",
                    textAlign: TextAlign.center,
                    style: Constants.boldHeading,
                  ),
                ),
                Column(
                  children: [
                    InputFieldWidget(
                      hintText: "Email...",
                      isPasswordField: false,
                      onChanged: (value) {
                        _registerEmail = value;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    InputFieldWidget(
                      hintText: "Password...",
                      onChanged: (value) {
                        _registerPassword = value;
                      },
                      //focusNode: _passwordFocusNode,
                      isPasswordField: true,
                      onSubmitted: (value) {
                        //_submitForm();
                      },
                    ),
                    ButtonWidget(
                      text: "Login",
                      onPressed: () async {
                        setState(() {
                          _loading = true;
                        });
                        try {
                          final newUser =
                              await _auth.signInWithEmailAndPassword(
                                  email: _registerEmail,
                                  password: _registerPassword);
                          if (newUser != null) {
                            final /*FirebaseUser*/ user = _auth.currentUser;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainFeedsPage(user: user)));
                          }
                          setState(() {
                            _loading = false;
                          });
                        } catch (e) {
                          print(e);
                          setState(() {
                            _loading = false;
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialogWidget(
                                      title: "Log in Error ",
                                      text1: "There was an error",
                                      text2: "$e",
                                      buttonText: "Retry");
                                });
                          });
                        }
                      },
                      //isLoading: _registerFormLoading,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: ButtonWidget(
                    text: "Create an Account",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    outlined: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
