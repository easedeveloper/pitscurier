import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecorations({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }){
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepOrange,
        )
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepOrange,
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      prefixIcon: ( prefixIcon != null )
          ? Icon( prefixIcon, color: Colors.orange[300],)
          : null,
    );
  }
}