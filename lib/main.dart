// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/blocs/app/app_cubit.dart';
import 'package:weather_app/core/constants/themes.dart';
import 'package:weather_app/core/local/cache_helper.dart';
import 'package:weather_app/features/next_five_days/presentation/pages/next_five_days_page.dart';
import 'package:weather_app/features/splash/presentation/pages/splash_page.dart';
import 'package:weather_app/features/weather/presentation/pages/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  String? favLocation = CacheHelper.getFavLocation(key: 'favLocation');
  runApp(MyApp(isDark: isDark, favLocation: favLocation));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final String? favLocation;
  const MyApp({Key? key, this.isDark, this.favLocation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(cityName: 'cairo')
        ..changeThemeMode(fromShared: isDark)
        ..changeFavLocation(fromShared: favLocation)
        ..getCurrentWeatherData()
        ..getFiveDaysWeatherForecastData()
        ..getOtherCities(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Weather app",
            initialRoute: '/splash_page',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            routes: {
              '/splash_page': (context) => SplashPage(),
              '/weather_page': (context) => WeatherPage(),
              '/next_five_days': (context) => NextFiveDaysPage(),
            },
          );
        },
      ),
    );
  }
}
