// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/core/widgets/text_widget.dart';
import 'package:weather_app/features/weather/data/models/current_weather_data.dart';
import 'package:weather_app/features/weather/presentation/widgets/card_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/drawer_widget.dart';
import 'package:weather_app/core/widgets/image_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/search_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/today_weather_listview.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        bool isDark = AppCubit.get(context).isDark;
        CurrentWeatherData currentWeatherData =
            AppCubit.get(context).currentWeatherData;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: DrawerWidget(),
          appBar: AppBar(
            title: SearchWidget(),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: () {
                  AppCubit.get(context).changeThemeMode();
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: isDark ? darkColor : lightColor,
                            ),
                            SizedBox(width: 8),
                            TextWidget(
                              text: (currentWeatherData.name != null)
                                  ? '${currentWeatherData.name}'
                                  : 'No data',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        TextWidget(
                          text:
                              DateFormat('EEEE HH:mm a').format(DateTime.now()),
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text: (currentWeatherData.main != null)
                                ? '${(currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103'
                                : 'No data',
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(width: 16),
                          (currentWeatherData.weather != null)
                              ? currentWeatherData.weather![0].description ==
                                      'clear sky'
                                  ? CloudImageWidget(
                                      dCloudImage: darkClearSky,
                                      lCloudImage: lightClearSky,
                                      height: 80,
                                      width: 80,
                                    )
                                  : currentWeatherData
                                              .weather![0].description ==
                                          'few clouds'
                                      ? CloudImageWidget(
                                          dCloudImage: dFewClouds,
                                          lCloudImage: lFewClouds,
                                          height: 80,
                                          width: 80,
                                        )
                                      : currentWeatherData
                                                  .weather![0].description ==
                                              'scattered clouds'
                                          ? CloudImageWidget(
                                              dCloudImage: dScatteredClouds,
                                              lCloudImage: lScatteredClouds,
                                              height: 80,
                                              width: 80,
                                            )
                                          : currentWeatherData.weather![0]
                                                      .description ==
                                                  'broken clouds'
                                              ? CloudImageWidget(
                                                  dCloudImage: dBrokenClouds,
                                                  lCloudImage: lBrokenClouds,
                                                  height: 80,
                                                  width: 80,
                                                )
                                              : Container()
                              : Container()
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextWidget(
                    text: (currentWeatherData.weather != null)
                        ? currentWeatherData.weather![0].description!
                            .toUpperCase()
                        : 'No data',
                    fontSize: 16,
                  ),
                  SizedBox(height: 25),
                  CardWidget(),
                  SizedBox(height: 40),
                  TodayWeatherListView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
