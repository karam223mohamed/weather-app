// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:weather_app/core/widgets/no_internet_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return WeatherWidget();
          } else {
            return NoInternetWidget();
          }
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
