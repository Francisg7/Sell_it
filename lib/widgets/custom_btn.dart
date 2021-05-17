import 'package:flutter/material.dart';


class Custombtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outLinebtn;
  final bool isLoading;

  Custombtn({this.text,this.onPressed,this.outLinebtn,this.isLoading});



  @override
  Widget build(BuildContext context) {

    bool _outLinebtn = outLinebtn ?? false;
    bool _isLoading  = isLoading ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outLinebtn ? Colors.transparent : Colors.black,
          border: Border.all(
            width: 2.0,

          ),
          borderRadius: BorderRadius.circular(15.0),
              
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 15.0,
        ),

        child: Stack(
          children: [
            Visibility(
              visible: _isLoading ? false : true,
              child: Center(
                child: Text(
                text ?? "Text",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: _outLinebtn ? Colors.black : Colors.white,
                ),
                ),
              ),
            ),
            Visibility(
              visible: _isLoading ,
              child: Center(
                child: SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: CircularProgressIndicator()),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
