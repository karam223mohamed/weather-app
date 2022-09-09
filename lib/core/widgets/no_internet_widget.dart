// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/strings.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: isDark
                    ? Image.asset(
                        darkNoConnection,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        lightNoConnection,
                        fit: BoxFit.cover,
                      ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "No Internet connection \n",
                      style: TextStyle(
                        fontSize: 26,
                        color: isDark ? Colors.grey.shade100 : Color(0xff161c2a),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Please check your internet connection \n and try again",
                      style: TextStyle(
                        fontSize: 15.5,
                        color: isDark
                            ? Colors.grey.shade50.withOpacity(0.5)
                            : Colors.grey.shade500,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
