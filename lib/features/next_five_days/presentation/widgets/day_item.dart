// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/features/weather/data/models/five_day_data.dart';
import 'package:weather_app/core/widgets/image_widget.dart';

class DayItem extends StatelessWidget {
  final FiveDayData item;

  const DayItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${item.temp}\u2103',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? darkColor : lightColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          item.weather![0].description == 'clear sky'
              ? CloudImageWidget(
                  dCloudImage: darkClearSky,
                  lCloudImage: lightClearSky,
                )
              : item.weather![0].description == 'few clouds'
                  ? CloudImageWidget(
                      dCloudImage: dFewClouds,
                      lCloudImage: lFewClouds,
                    )
                  : item.weather![0].description == 'scattered clouds'
                      ? CloudImageWidget(
                          dCloudImage: dScatteredClouds,
                          lCloudImage: lScatteredClouds,
                        )
                      : item.weather![0].description == 'broken clouds'
                          ? CloudImageWidget(
                              dCloudImage: dBrokenClouds,
                              lCloudImage: lBrokenClouds,
                            )
                          : CloudImageWidget(
                              dCloudImage: dScatteredClouds,
                              lCloudImage: lScatteredClouds,
                            ),
          SizedBox(
            width: 10,
          ),
          Text(
            '${item.time}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isDark ? darkColor : lightColor,
            ),
          ),
        ],
      ),
    );
  }
}
