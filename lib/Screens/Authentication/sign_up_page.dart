import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sell_it/widgets/custom_btn.dart';
import 'package:sell_it/widgets/custom_inputs.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {
  static const String id = "SignUpPage";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _registerEmail = "";
  String _registerPassword = "";
  final _auth = FirebaseAuth.instance;
  bool _loading = false;
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
                    "Create A New Account",
                    textAlign: TextAlign.center,
                    style: Constants.boldHeading,
                  ),
                ),
                Column(
                  children: [
                    CustomInputs(
                      hintext: "Email...",
                      onChanged: (value) {
                        _registerEmail = value;
                      },
                      onSubmitted: (value) {
                        //_passwordFocusNode.requestFocus();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    CustomInputs(
                      hintext: "Password...",
                      onChanged: (value) {
                        _registerPassword = value;
                      },
                      //focusNode: _passwordFocusNode,
                      isPasswordField: true,
                      onSubmitted: (value) {
                        //_submitForm();
                      },
                    ),
                    Custombtn(
                      text: "Create New Account",
                      onPressed: () async {
                        //_submitForm();
                        setState(() {
                          _loading = true;
                        });
                        try {
                          print(_registerEmail);
                          print(_registerPassword);
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: _registerEmail,
                                  password: _registerPassword);
                          if (newUser != null) {
                            print(newUser);
                            return null;
                          }
                          setState(() {
                            _loading = false;
                          });
                        } catch (e) {
                          print(e);
                          return e.toString();
                        }
                      },
                      //isLoading: _registerFormLoading,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Custombtn(
                    text: "Back To Login",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    outLinebtn: true,
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
