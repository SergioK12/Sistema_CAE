import 'package:flutter/material.dart';

var themedatalight = ThemeData.light(
  
).copyWith(
  primaryColor: Colors.blueGrey,
  
  primaryColorDark: Colors.lightGreen[600],

  textTheme: const TextTheme(
     bodyMedium: TextStyle(
      color: Colors.black
    ),
    
  )

);
