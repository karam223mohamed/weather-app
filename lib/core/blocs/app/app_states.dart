part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class CurrentWeatherDataLoaded extends AppStates {}

class FiveDayWeatherForecastDataLoaded extends AppStates {}

class ArabCitiesLoaded extends AppStates {}

class AppThemeModeChangeState extends AppStates {}

class FavLocationChangeState extends AppStates {}
