import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[800],
      appBarTheme: AppBarTheme(
        color: Colors.deepPurple[800],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w200,
        ),
      ));
}

ThemeData lightTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[800],
      appBarTheme: AppBarTheme(
        color: Colors.deepPurple[800],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          color: Colors.black,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w200,
        ),
      ));
}
