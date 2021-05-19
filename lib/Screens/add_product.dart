import 'package:flutter/material.dart';
import 'package:sell_it/widgets/custom_action_bar.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomActionBar(
        title: "Add Product",
        hasBackArrow: false,
      ),

    );
  }
}
