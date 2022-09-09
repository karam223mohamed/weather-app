// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/widgets/no_data_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/city_item.dart';

class OtherLocationsListView extends StatelessWidget {
  const OtherLocationsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppCubit.get(context).arabCities.isEmpty
              ? NoDataWidget()
              : RefreshIndicator(
                  onRefresh: () async {},
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        CityItem(item: AppCubit.get(context).arabCities[index]),
                    itemCount: AppCubit.get(context).arabCities.length,
                  ),
                ),
        ],
      ),
    );
  }
}
