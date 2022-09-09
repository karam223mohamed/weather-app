// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/features/weather/data/models/current_weather_data.dart';
import 'package:weather_app/core/widgets/image_widget.dart';

class CityItem extends StatelessWidget {
  final CurrentWeatherData item;

  const CityItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    '${item.name}',
                    style: TextStyle(
                      fontSize: 24,
                      color: isDark ? darkColor : lightColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item.weather![0].description == 'clear sky'
                      ? CloudImageWidget(
                          dCloudImage: darkClearSky,
                          lCloudImage: lightClearSky,
                          height: 25,
                          width: 25,
                        )
                      : item.weather![0].description == 'few clouds'
                          ? CloudImageWidget(
                              dCloudImage: dFewClouds,
                              lCloudImage: lFewClouds,
                              height: 25,
                              width: 25,
                            )
                          : item.weather![0].description == 'scattered clouds'
                              ? CloudImageWidget(
                                  dCloudImage: dScatteredClouds,
                                  lCloudImage: lScatteredClouds,
                                  height: 25,
                                  width: 25,
                                )
                              : item.weather![0].description == 'broken clouds'
                                  ? CloudImageWidget(
                                      dCloudImage: dBrokenClouds,
                                      lCloudImage: lBrokenClouds,
                                      height: 25,
                                      width: 25,
                                    )
                                  : CloudImageWidget(
                                      dCloudImage: dScatteredClouds,
                                      lCloudImage: lScatteredClouds,
                                      height: 25,
                                      width: 25,
                                    ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${(item.main!.temp! - 273.15).round().toString()}\u2103',
                    style: TextStyle(
                      fontSize: 20,
                      color: isDark ? darkColor : lightColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
