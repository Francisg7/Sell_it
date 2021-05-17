import 'package:flutter/cupertino.dart';
import 'package:sell_it/widgets/custom_action_bar.dart';

class SellTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Stack(
        children: [
          Center(
            child: Text("Sell IT"),
          ),
          CustomActionBar(
            title: "Sell IT",
            hasBackArrow: false,
          ),
        ],
      )
    );
  }
}
