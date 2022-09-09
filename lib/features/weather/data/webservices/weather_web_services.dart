import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/features/weather/data/models/current_weather_data.dart';
import 'package:weather_app/features/weather/data/models/five_day_data.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository.dart';

class WeatherWebService {
  final String cityName;

  WeatherWebService({required this.cityName});

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?q=$cityName&$apiKey';
    WeatherRepository(url: url, payload: null).getCurrentWeatherData(
      beforeSend: () => beforeSend,
      onSuccess: (data) => onSuccess!(CurrentWeatherData.fromJson(data)),
      onError: (error) => onError,
    );
  }

  void getFiveDaysWeatherForecastData({
    Function()? beforeSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$cityName&$apiKey';
    WeatherRepository(url: url, payload: null).getFiveDaysWeatherForecastData(
      beforeSend: () => beforeSend,
      onSuccess: (data) => {
        onSuccess!(
          (data['list'] as List).map((e) => FiveDayData.fromJson(e)).toList(),
        ),
      },
      onError: (error) => onError,
    );
  }
}
