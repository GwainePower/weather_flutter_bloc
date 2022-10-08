import 'package:flutter/material.dart';

import '../navigation/main_navigation.dart';

// Основной виджет приложения
class WeatherApp extends StatelessWidget {
  static final _mainNavigation = MainNavigation();
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Убираем debug баннер
      title: 'Weather Flutter BloC',
      routes: _mainNavigation.routes,
      initialRoute: RouteNames.search, // Стартовая страница - страница поиска
    );
  }
}
