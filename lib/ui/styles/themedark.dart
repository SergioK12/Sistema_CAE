import 'package:flutter/material.dart';

var themedatadark = ThemeData.dark().copyWith(
  primaryColor: Colors.black,
  
   primaryColorDark: Colors.grey[600],
   textTheme: const TextTheme(
     bodyMedium: TextStyle(
      color: Colors.white
    ),
  )
);
