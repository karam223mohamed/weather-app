// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/core/widgets/no_data_widget.dart';
import 'package:weather_app/features/weather/data/models/five_day_data.dart';
import 'package:weather_app/features/next_five_days/presentation/widgets/day_item.dart';

class DayListView extends StatelessWidget {
  final Duration duration;
  const DayListView({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    List<FiveDayData> dayForecast = AppCubit.get(context)
        .fiveDayData
        .where((element) =>
            element.dateTime ==
            DateFormat.E().format(DateTime.now().add(duration)))
        .toList();

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('EEEE, d MMM').format(
              DateTime.now().add(
                duration,
              ),
            ),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isDark ? darkColor : lightColor,
            ),
          ),
          dayForecast.isEmpty
              ? NoDataWidget()
              : RefreshIndicator(
                  onRefresh: () async {},
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        DayItem(item: dayForecast[index]),
                    itemCount: dayForecast.length.clamp(0, 1),
                  ),
                ),
        ],
      ),
    );
  }
}
