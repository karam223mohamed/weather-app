// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/core/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: lightBackgroundColor,
  fontFamily: 'Quicksand',
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: lightStatusBarColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: lightBackgroundColor,
    titleTextStyle: TextStyle(
      fontFamily: 'OpenSans',
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: lightIconThemeColor,
    ),
    elevation: 0.5,
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: darkBackgroundColor,
  fontFamily: 'Quicksand',
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkStatusBarColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: darkBackgroundColor,
    titleTextStyle: TextStyle(
      fontFamily: 'OpenSans',
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: darkIconThemeColor,
    ),
    elevation: 0.5,
  ),
);
