import 'package:intl/intl.dart';

class Sys {
  // final int? type;
  final int? id;
  // final String? country;
  final String? sunrise;
  final String? sunset;

  Sys({
    // this.type,
    this.id,
    // this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(dynamic json) {
    if (json == null) {
      return Sys();
    }

    // Convert Timestamp to datetime
    int sunriseTimeStamp = json['sunrise'];
    DateTime sunriseDateTime =
        DateTime.fromMillisecondsSinceEpoch(sunriseTimeStamp * 1000);
    String fSunriseDateTime = DateFormat.jm().format(sunriseDateTime);
    int sunsetTimeStamp = json['sunset'];
    DateTime sunsetDateTime =
        DateTime.fromMillisecondsSinceEpoch(sunsetTimeStamp * 1000);
    String fSunsetDateTime = DateFormat.jm().format(sunsetDateTime);

    return Sys(
      // type: json['type'],
      id: json['id'],
      // country: json['country'],
      sunrise: fSunriseDateTime,
      sunset: fSunsetDateTime,
    );
  }
}
