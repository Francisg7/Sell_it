import 'package:flutter/material.dart';
import 'package:sell_it/Constants/text_style_constants.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final bool isPasswordField;

  InputFieldWidget({
    @required this.hintText,
    this.isPasswordField,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        keyboardType: (isPasswordField
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress),
        obscureText: isPasswordField,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? "Hint Text...",
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 18.0,
            )),
        style: Constants.regularDarkText,
      ),
    );
  }
}
