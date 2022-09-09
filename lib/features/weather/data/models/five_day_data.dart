// import 'package:intl/intl.dart';

import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/data/models/weather.dart';

class FiveDayData {
  final String? dateTime;
  final String? time;
  final int? temp;
  // final int? tempMin;
  // final int? tempMax;
  // final int? humidity;
  final List<Weather>? weather;

  FiveDayData({
    this.dateTime,
    this.time,
    this.temp,
    // this.tempMin,
    // this.tempMax,
    // this.humidity,
    this.weather,
  });

  factory FiveDayData.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayData();
    }

    String dtTxt = json['dt_txt'];
    DateTime dt = DateTime.parse(dtTxt);
    DateTime t = DateTime.parse(dtTxt);
    String dateTime = DateFormat.E().format(dt);
    String time = DateFormat.jm().format(t);

    return FiveDayData(
      dateTime: dateTime,
      time: time,
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
      // tempMin:
      //     (double.parse(json['main']['temp_min'].toString()) - 273.15).round(),
      // tempMax:
      //     (double.parse(json['main']['temp_max'].toString()) - 273.15).round(),
      // humidity: json['main']['humidity'],
      weather:
          (json['weather'] as List).map((w) => Weather.fromJson(w)).toList(),
    );
  }
}
