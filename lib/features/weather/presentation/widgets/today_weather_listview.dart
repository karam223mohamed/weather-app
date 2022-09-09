// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/core/widgets/no_data_widget.dart';
import 'package:weather_app/core/widgets/text_widget.dart';
import 'package:weather_app/features/weather/data/models/five_day_data.dart';
import 'package:weather_app/features/weather/presentation/widgets/today_weather_item.dart';

class TodayWeatherListView extends StatelessWidget {
  const TodayWeatherListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        List<FiveDayData> todayForecast = AppCubit.get(context)
            .fiveDayData
            .where((element) =>
                element.dateTime == DateFormat.E().format(DateTime.now()))
            .toList();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: TextWidget(
                      text: 'Today',
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/next_five_days');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Row(
                        children: [
                          TextWidget(
                            text: 'Next 5 days',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: isDark ? darkColor : lightColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 150,
                child: todayForecast.isEmpty
                    ? NoDataWidget()
                    : RefreshIndicator(
                        onRefresh: () async {},
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              TodayWeatherItem(item: todayForecast[index]),
                          itemCount: todayForecast.length.clamp(0, 5),
                        ),
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
