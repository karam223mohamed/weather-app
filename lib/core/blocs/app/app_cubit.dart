// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/local/cache_helper.dart';
import 'package:weather_app/features/weather/data/models/current_weather_data.dart';
import 'package:weather_app/features/weather/data/models/five_day_data.dart';
import 'package:weather_app/features/weather/data/webservices/weather_web_services.dart';

part 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit({this.cityName}) : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  String? cityName;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<FiveDayData> fiveDayData = [];
  List<CurrentWeatherData> arabCities = [];
  void updateWeather() {
    getCurrentWeatherData();
    getFiveDaysWeatherForecastData();
  }

  void getCurrentWeatherData() {
    WeatherWebService(cityName: '$cityName').getCurrentWeatherData(
      onSuccess: (data) {
        currentWeatherData = data;
        emit(CurrentWeatherDataLoaded());
      },
      onError: (error) {
        debugPrint(error);
      },
    );
  }

  void getFiveDaysWeatherForecastData() {
    WeatherWebService(cityName: '$cityName').getFiveDaysWeatherForecastData(
      onSuccess: (data) {
        fiveDayData = data;
        emit(FiveDayWeatherForecastDataLoaded());
      },
      onError: (error) {
        debugPrint(error);
      },
    );
  }

  void getOtherCities() {
    List<String> cities = ['Cairo', 'Riyadh', 'Abu Dhabi', 'Rabat'];
    for (var cityName in cities) {
      WeatherWebService(cityName: cityName).getCurrentWeatherData(
        onSuccess: (data) {
          arabCities.add(data);
          emit(ArabCitiesLoaded());
        },
        onError: (error) {
          debugPrint(error);
        },
      );
    }
  }

  bool isDark = true;
  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppThemeModeChangeState());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: "isDark", value: isDark).then((value) {
        emit(AppThemeModeChangeState());
      });
    }
  }

  String favLocation = 'cairo';
  void changeFavLocation({String? fromShared}) {
    if (fromShared != null) {
      favLocation = fromShared;
      emit(FavLocationChangeState());
    } else {
      favLocation = cityName!;
      CacheHelper.setFavLocation(key: "favLocation", value: favLocation)
          .then((value) {
        emit(FavLocationChangeState());
      });
    }
  }
}
