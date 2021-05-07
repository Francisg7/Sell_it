import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlined;
  final bool isLoading;

  ButtonWidget({this.text, this.onPressed, this.outlined, this.isLoading});

  @override
  Widget build(BuildContext context) {
    bool _outlined = outlined ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outlined ? Colors.transparent : Colors.black,
          border: Border.all(
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 15.0,
        ),
        child: Center(
          child: Text(
            text ?? "Text",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: _outlined ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
