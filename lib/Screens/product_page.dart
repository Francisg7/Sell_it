import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/constants.dart';
import 'package:sell_it/services/firebase_services.dart';
import 'package:sell_it/widgets/custom_action_bar.dart';
import 'package:sell_it/widgets/image_swap.dart';
import 'package:sell_it/widgets/product_size.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  ProductPage({this.productId});


  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseServices _firebaseServices =FirebaseServices();
  String _selectedProductSize = "0";

  Future _addToCart(){
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Cart")
        .doc(widget.productId)
        .set({"size":_selectedProductSize});
  }

  Future _addToSaved(){
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Saved")
        .doc(widget.productId)
        .set({"size":_selectedProductSize});
  }

  final SnackBar _snackBar = SnackBar(
    content: Text("Product added to the cart"),
  );
  final SnackBar _snackBar2 = SnackBar(
    content: Text("Product added to the Saved"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _firebaseServices.productsRef.doc(widget.productId).get(),
            builder: (context, snapshot){
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if(snapshot.connectionState == ConnectionState.done){
                //Firebase Document Data
                Map<String, dynamic> documentData = snapshot.data.data();

                //List of images
                List imageList = documentData['images'];
                List productSizes = documentData['size'];


                // set an initial size
                _selectedProductSize =productSizes[0];

                return ListView(
                  padding: EdgeInsets.all(0.0),
                  children: [
                    ImageSwap(imageList: imageList,),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        "${documentData['name']}",
                      style: Constants.boldHeading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        "${documentData['price']}fcfa",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        "${documentData['desc']}",
                      style: TextStyle(
                        fontSize: 16.0
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                      child: Text(
                        "Select Size",
                      style: Constants.regularDarkText,
                      ),
                    ),
                    ProductSize(
                      productSizes: productSizes,
                      onSelected: (size){
                        _selectedProductSize = size;
                      }
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await _addToSaved();
                              Scaffold.of(context).showSnackBar(_snackBar2);
                           },
                            child: Container(
                              width: 65.0,
                              height: 65.0,
                              decoration: BoxDecoration(
                              color: Color(0xffdcdcdc),
                                borderRadius: BorderRadius.circular(12.0),
                            ),
                              alignment : Alignment.center,
                              child: Image(
                                image: AssetImage(
                                  "Assets/tab_save.png"
                                ),
                                height: 22.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async{
                               await _addToCart();
                               Scaffold.of(context).showSnackBar(_snackBar);
                              },
                              child: Container(
                                height: 65.0,
                                margin: EdgeInsets.only(left: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12.0)
                                ),
                                alignment: Alignment.center,
                                child: Text("Add to cart",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                );
              }

              //Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            hasBackArrow: true,
            hasTitle: false,
            hasBackground: false,
          )
        ],
      ),
    );
  }
}
