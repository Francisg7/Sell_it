import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/constants.dart';
import 'package:sell_it/services/firebase_services.dart';
import 'package:sell_it/widgets/custom_inputs.dart';
import 'package:sell_it/widgets/product_card.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  FirebaseServices _firebaseServices = FirebaseServices();

  String _searchString = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if(_searchString.isEmpty)
            Center(
              child: Container(
                  child: Text(
                    "Search Results", style: Constants.regularDarkText,)),
            )
          else
            FutureBuilder<QuerySnapshot>(
              future: _firebaseServices.productsRef
                  .orderBy("search_string")
                  .startAt([_searchString])
                  .endAt(["$_searchString\uf8ff"])
                  .get(),
              builder: (context, snapshot){
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }
                //collection data ready to display
                if(snapshot.connectionState == ConnectionState.done){
                  //display the data inside the listview
                  return ListView(
                      padding: EdgeInsets.only(
                          top: 115.0,
                          bottom: 12.0
                      ),
                      children: snapshot.data.docs.map((document){
                        return ProductCard(
                          title: document.data()['name'],
                          imageUrl: document.data()['images'][0],
                          price: "${document.data()['price']}Fcfa",
                          productId: document.id,
                        );
                      }).toList()
                  );
                }
                //Loading State
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: CustomInputs(
              hintext: "Search here....",
              onSubmitted: (value){
                  setState(() {
                    _searchString = value.toUpperCase();
                  });
              },
            ),
          ),
        ],
      )
    );
  }
}
