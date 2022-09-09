import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';

class CloudImageWidget extends StatelessWidget {
  final String dCloudImage;
  final String lCloudImage;
  final double height;
  final double width;
  const CloudImageWidget({
    Key? key,
    this.dCloudImage = 'assets/images/d_clear_sky.png',
    this.lCloudImage = 'assets/images/l_clear_sky.png',
    this.height = 50,
    this.width = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = AppCubit.get(context).isDark;
    return SizedBox(
      height: height,
      width: height,
      child: isDark ? Image.asset(dCloudImage) : Image.asset(lCloudImage),
    );
  }
}
