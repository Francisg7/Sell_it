import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/cart_page.dart';
import 'package:sell_it/Screens/constants.dart';
import 'package:sell_it/services/firebase_services.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;
  CustomActionBar({this.title,this.hasBackArrow, this.hasTitle, this.hasBackground});
  FirebaseServices _firebaseServices =FirebaseServices();

  final CollectionReference _usersRef =
  // User -> UserId(document) -> cart -> ProductID(document)
  FirebaseFirestore.instance.collection("Users");



  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackground = hasBackground ?? true;

    return Container(
      decoration: BoxDecoration(
        gradient: _hasBackground? LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0)
          ],
          begin: Alignment(0,0),
          end: Alignment(0,1)
        ):null
      ),
      padding: EdgeInsets.fromLTRB(24.0, 56.0, 24.0, 42.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(_hasBackArrow)
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 36.0,
                height: 36.0,
                // decoration: BoxDecoration(
                //   color: Colors.black,
                //   borderRadius: BorderRadius.circular(6.0),
                // ),
                child: Icon(
                  Icons.arrow_back_ios,
                ),
                color: Colors.white,
              ),
            ),
          if(_hasTitle)
            Text(
               title ?? "Action Bar",
              style: Constants.boldHeading,
            ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
            },
            child: Container(
              width: 36.0,
              height: 36.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6.0),
              ),
              alignment: Alignment.center,
              child: StreamBuilder(
                stream: _usersRef.doc(_firebaseServices.getUserId()).collection("Cart").snapshots(),
                builder: (context, snapshot){
                  int _totalItems = 0;
                    if(snapshot.data == null){
                      return CircularProgressIndicator();
                    }

                  if(snapshot.connectionState == ConnectionState.active){
                    List _documents = snapshot.data.docs;
                    _totalItems = _documents.length;
                  }

                  return Text(
                     "$_totalItems" ?? "0",
                      style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                  );
                },
              )
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0,5.0,0.0,5.0),
            child: Container(
              width: 30.0,
              height: 30.0,
              // decoration: BoxDecoration(
              //   color: Colors.black,
              //   borderRadius: BorderRadius.circular(12.0),
              // ),
              child: GestureDetector(
                onTap: (){
                  FirebaseAuth.instance.signOut();
                },
                child: Image(
                image: AssetImage(
                    "Assets/tab_settings.png"
                ),
                 height: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
