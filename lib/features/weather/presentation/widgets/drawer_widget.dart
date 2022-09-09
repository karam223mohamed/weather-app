// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unused_local_variable
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/features/weather/presentation/widgets/other_cities_listview.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    String favLocation = AppCubit.get(context).favLocation;
    return Drawer(
      backgroundColor:
          isDark ? darkDrawerBackgroundColor : lightDrawerBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.settings,
                    color: isDark ? darkColor : lightColor,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: isDark ? darkColor : lightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Favourite city',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isDark ? darkColor : lightColor,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.info_outline,
                      color: isDark ? darkColor : lightColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                        ),
                        Icon(
                          Icons.location_on_rounded,
                          color: isDark ? darkColor : lightColor,
                          size: 16,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          favLocation.toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDark ? darkColor : lightColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: isDark
                              ? Image.asset(darkClearSky)
                              : Image.asset(lightClearSky),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${(AppCubit.get(context).currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                          style: TextStyle(
                            fontSize: 20,
                            color: isDark ? darkColor : lightColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 0.5,
                  color: isDark ? darkColor : lightColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_location_outlined,
                          color: isDark ? darkColor : lightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Other cities',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isDark ? darkColor : lightColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                OtherLocationsListView(),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 0.5,
                  color: isDark ? darkColor : lightColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.report_outlined,
                      color: isDark ? darkColor : lightColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Report wrong location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDark ? darkColor : lightColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.headphones_outlined,
                      color: isDark ? darkColor : lightColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Contact us',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDark ? darkColor : lightColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
