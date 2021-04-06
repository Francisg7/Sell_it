import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/widgets/custom_btn.dart';
import 'package:sell_it/widgets/custom_inputs.dart';

import '../constants.dart';

class SignIn extends StatefulWidget {
  static const String id = "SignInPage";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _registerEmail = "";
  String _registerPassword = "";
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                    text: "Login",
                    onPressed: () async {
                      //_submitForm();
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: _registerEmail, password: _registerPassword);
                        if (newUser != null) {
                          return null;
                        }
                      } catch (e) {
                        print(e);
                        return e.message;
                      } catch (e) {
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
    );
  }
}
