import 'package:flutter/material.dart';
import 'package:sell_it/Screens/constants.dart';

class CustomInputs extends StatelessWidget {
  final String hintext;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final bool isPasswordField;

  CustomInputs({this.hintext,this.onChanged,this.onSubmitted, this.focusNode,this.textInputAction,this.isPasswordField});


  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: TextField(
        obscureText: _isPasswordField,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        textInputAction: textInputAction,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintext ?? "Hint Text...",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 18.0,
        )
      ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
