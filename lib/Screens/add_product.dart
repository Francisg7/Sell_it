import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/Chat/constants.dart';
import 'package:sell_it/widgets/button_widget.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
// }

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class SaveToDB {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addProducs(Map<String, dynamic> products) async {
    await _db.collection('Product').doc().set(products);
  }
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  String ProductName = '';
  String ProductDesc = '';
  String ProductSize = '';
  String ProductPrice = '';
  String ProductImage = '';

  void _handleSubmission(String value) {
    var products = <String, dynamic>{
      'name': '$ProductName',
      'desc': '$ProductDesc',
      'size': '$ProductSize',
      'price': '$ProductPrice',
      'postTimeStamp': DateTime.now().millisecondsSinceEpoch,
      'images': "$ProductImage",
    };
    SaveToDB.addProducs(products);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Add product",
            style: Constants.regularHeading,
          ),
          backgroundColor: Colors.white,
          toolbarOpacity: 1.0,
        ),
        body: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildProductName(),
              const SizedBox(height: 16),
              buildProductDesc(),
              const SizedBox(height: 16),
              buildProductSize(),
              const SizedBox(height: 20),
              buildProductPrice(),
              const SizedBox(height: 20),
              buildProductImage(),
              const SizedBox(height: 20),
              buildSubmit(_handleSubmission),
            ],
          ),
        ),
      );

  Widget buildProductName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Product Name',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 500,
        onSaved: (value) => setState(() => ProductName = value),
      );
  Widget buildProductDesc() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Product Description',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 500,
        onSaved: (value) => setState(() => ProductDesc = value),
      );
  Widget buildProductSize() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Product Size',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value.length < 2) {
            return 'Enter at least a size';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => ProductSize = value),
      );
  Widget buildProductPrice() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Product Price',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value.length < 2) {
            return 'Enter at least a Price';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => ProductPrice = value),
      );

  Widget buildProductImage() => GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Product Image',
            border: OutlineInputBorder(),
            // errorBorder:
            //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
            // focusedErrorBorder:
            //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
            // errorStyle: TextStyle(color: Colors.purple),
          ),
          validator: (value) {
            if (value.length < 2) {
              return 'Enter at least an Image';
            } else {
              return null;
            }
          },
          onSaved: (value) => setState(() => ProductImage = value),
        ),
      );

  Widget buildSubmit(_handleSubmission) => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState.save();

              final message =
                  'ProductName: $ProductName\nProductDesc: $ProductDesc\nProductPrice: $ProductPrice\nProductSize: $ProductSize\nProductImage: $ProductImage';
              Navigator.pop(context);
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );
}
