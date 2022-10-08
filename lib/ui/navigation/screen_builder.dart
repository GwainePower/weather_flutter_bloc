import 'package:flutter/material.dart';

import '../screens/search_screen.dart';
import '../screens/weather_details_screen.dart';
import '../screens/forecast_screen.dart';

// Класс состоит из методов, возвращающих нам конкретные страницы
class ScreenBuilder {
  Widget buildSearchScreen() => const SearchScreen();
  Widget buildWeatherDetailsScreen() => const WeatherDetailsScreen();
  Widget buildForecastScreen() => const ForecastScreen();
}
