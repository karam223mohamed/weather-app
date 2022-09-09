// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    return Center(
      child: Text(
        'No data available',
        style: TextStyle(
          fontSize: 18,
          color: isDark ? darkColor : lightColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
