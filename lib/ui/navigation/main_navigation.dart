import 'package:flutter/cupertino.dart';
import 'package:weather_flutter_bloc/ui/navigation/screen_builder.dart';

class RouteNames {
  static const search = '/search';
  static const weatherDetails = '/weather-details';
  static const weatherForecast = '/weather-forecast';
}

// Переменную routes из класса основной навигации используем
// в параметре routes в основном виджете с MaterialApp
class MainNavigation {
  static final screenBuilder = ScreenBuilder();

  final routes = <String, Widget Function(BuildContext)>{
    RouteNames.search: (_) => screenBuilder.buildSearchScreen(),
    RouteNames.weatherDetails: (_) => screenBuilder.buildWeatherDetailsScreen(),
    RouteNames.weatherForecast: (_) => screenBuilder.buildForecastScreen(),
  };
}
