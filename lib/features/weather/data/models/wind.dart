class Wind {
  final double? speed;
  // final int? deg;
  // final double? gust;

  Wind({
    this.speed,
    // this.deg,
    // this.gust,
  });

  factory Wind.fromJson(dynamic json) {
    if (json == null) {
      return Wind();
    }

    return Wind(
      speed: double.parse(json['speed'].toString()),
      // deg: json['deg'],
    );
  }
}
