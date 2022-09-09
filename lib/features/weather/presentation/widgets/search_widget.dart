// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: TextField(
          onChanged: (value) => AppCubit.get(context).cityName = value.trim(),
          onSubmitted: (value) {
            AppCubit.get(context).updateWeather();
            AppCubit.get(context).changeFavLocation();
          },
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search for a city...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
