import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../home_page.dart';
import 'login.dart';

class LandingPage extends StatelessWidget {
  /// Widget's id name used with routes
  static const String id = "LandingPage";

  /// Initialising the Firebase instance in the app
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, initialisationSnapshot) {
        // If Firebase App init, snapshot has error
        /// Checking if an error occurred during the Initialisation of the Firebase instance in the app
        if (initialisationSnapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${initialisationSnapshot.error}"),
            ),
          );
        }

        /// Checking if Initialisation of the Firebase instance in the app was successful
        if (initialisationSnapshot.connectionState == ConnectionState.done) {
          // StreamBuilder can check the login state live
          return StreamBuilder(
            /// Creating an instance of a stream from firebase that provides us with info about the login state of the user in the app.
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, authStreamSnapshot) {
              /// Checking if an error occurred during the Instantiation of the Firebase authenticationState stream instance
              if (authStreamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${authStreamSnapshot.error}"),
                  ),
                );
              }

              /// Checking if Instantiation of the Firebase authenticationState stream instance was successful
              if (authStreamSnapshot.connectionState ==
                  ConnectionState.active) {
                // Get the user
                ///Retrieving the user's authentication state from authenticationState stream
                User _user = authStreamSnapshot.data;

                /// Checking if there is no user logged in
                if (_user == null) {
                  // user not logged in, head to login
                  return LoginPage();
                }

                /// Checking if there is a user logged in
                else if (_user != null) {
                  // The user is logged in, head to homepage
                  return HomePage(user: _user);
                }

                /// Default statement if everything in the authentication works well but we can't tell if the user is logged in or not
                else {
                  return Scaffold(
                    body: Center(
                      child: Text(
                        "Something Wrong happened, \nEverything works just fine but we can't tell if the user is logged in or not",
                        style: Constants.regularHeading,
                      ),
                    ),
                  );
                }
              }

              /// Screen displayed while Creating the authenticationState stream and checking the user's login state.
              return Scaffold(
                body: Center(
                  child: Text(
                    "Checking Authentication...",
                    style: Constants.regularHeading,
                  ),
                ),
              );
            },
          );
        }

        /// Screen displayed while Initializing the Firebase instance in the app
        return Scaffold(
          body: Center(
            child: Text(
              "Initialization App...",
              style: Constants.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
