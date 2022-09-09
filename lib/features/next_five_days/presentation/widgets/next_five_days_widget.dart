// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/colors.dart';
import 'package:weather_app/features/next_five_days/presentation/widgets/day_listview.dart';

class NextFiveDaysWidget extends StatelessWidget {
  const NextFiveDaysWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppCubit.get(context).cityName!.toUpperCase()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DayListView(
                        duration: Duration(days: 1),
                      ),
                      Divider(
                        color: isDark ? darkColor : lightColor,
                        thickness: 0.2,
                      ),
                      DayListView(
                        duration: Duration(days: 2),
                      ),
                      Divider(
                        color: isDark ? darkColor : lightColor,
                        thickness: 0.2,
                      ),
                      DayListView(
                        duration: Duration(days: 3),
                      ),
                      Divider(
                        color: isDark ? darkColor : lightColor,
                        thickness: 0.2,
                      ),
                      DayListView(
                        duration: Duration(days: 4),
                      ),
                      Divider(
                        color: isDark ? darkColor : lightColor,
                        thickness: 0.2,
                      ),
                      DayListView(
                        duration: Duration(days: 5),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
