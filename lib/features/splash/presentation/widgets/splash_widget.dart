// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/core/constants/strings.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/weather_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: isDark
                  ? Image.asset(darkClearSky)
                  : Image.asset(lightClearSky),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Discover the weather \n in your city',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: isDark ? darkColor : lightColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Get to know your weather and \n precipitation forecast',
              style: TextStyle(
                fontSize: 20,
                color: isDark ? darkColor : lightColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
