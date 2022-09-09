// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/core/widgets/text_widget.dart';
import 'package:weather_app/features/weather/data/models/current_weather_data.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        bool isDark = AppCubit.get(context).isDark;
        CurrentWeatherData currentWeatherData =
            AppCubit.get(context).currentWeatherData;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 210,
              child: Card(
                color: isDark ? darkCardColor : lightCardColor,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              TextWidget(text: 'Sunrise'),
                              TextWidget(
                                text: (currentWeatherData.sys != null)
                                    ? '${currentWeatherData.sys!.sunrise}'
                                    : 'No data',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: isDark
                                    ? Image.asset(darkSunrise)
                                    : Image.asset(lightSunrise),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextWidget(text: 'Sunset'),
                              TextWidget(
                                text: (currentWeatherData.sys != null)
                                    ? '${currentWeatherData.sys!.sunset}'
                                    : 'No data',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: isDark
                                    ? Image.asset(darkSunset)
                                    : Image.asset(lightSunset),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(text: 'Feels like'),
                                TextWidget(
                                  text: (currentWeatherData.main != null)
                                      ? '${(currentWeatherData.main!.feelsLike! - 273.15).round().toString()}\u2103'
                                      : 'No data',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(text: 'Wind'),
                                TextWidget(
                                  text: (currentWeatherData.wind != null)
                                      ? '${AppCubit.get(context).currentWeatherData.wind!.speed}m/s'
                                      : 'No data',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(text: 'Humidity'),
                                TextWidget(
                                  text: (currentWeatherData.main != null)
                                      ? '${(AppCubit.get(context).currentWeatherData.main!.humidity)}%'
                                      : 'No data',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(text: 'Pressure'),
                                TextWidget(
                                  text: (currentWeatherData.main != null)
                                      ? '${(AppCubit.get(context).currentWeatherData.main!.pressure)}hpa'
                                      : 'No data',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
