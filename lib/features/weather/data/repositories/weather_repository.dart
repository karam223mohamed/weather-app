import 'package:dio/dio.dart';

class WeatherRepository {
  final String? url;
  final Map<String, dynamic>? payload;

  WeatherRepository({this.url, this.payload});

  Dio dio = Dio();

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(Map<String, dynamic> data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    dio.get(url!, queryParameters: payload).then(
      (response) {
        if (onSuccess != null) {
          onSuccess(response.data);
        }
      },
    ).catchError((error) {
      onError!(error);
    });
  }

  void getFiveDaysWeatherForecastData({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    dio.get(url!, queryParameters: payload).then(
      (response) {
        if (onSuccess != null) {
          onSuccess(response.data);
        }
      },
    ).catchError((error) {
      onError!(error);
    });
  }
}
