import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  String buttonText;
  VoidCallback onButtonPress;

  ButtonWidget({required this.buttonText,
    required this.onButtonPress,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
        ),
        onPressed: onButtonPress,
        child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
        )
    );
  }

}