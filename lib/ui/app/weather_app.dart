import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/theme_bloc.dart';
import '../../domain/bloc/weather_bloc.dart';
import '../navigation/main_navigation.dart';

// Основной виджет приложения
class WeatherApp extends StatelessWidget {
  static final _mainNavigation = MainNavigation();
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Создаем переменную с BloC погоды, оборачиваем приложение
    // в BlocProvider, так как на всех трёх страницах будет происходить
    // взаимодействие с ним
    // Также в провайдер добавлена поддержка смены темы со светлой на тёмную
    final weatherBloc = WeatherBloc();
    final themeBloc = ThemeBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => weatherBloc,
        ),
        BlocProvider(
          create: (context) => themeBloc,
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // Убираем debug баннер
            title: 'Weather Flutter BloC',
            theme: state,
            routes: _mainNavigation.routes,
            initialRoute:
                RouteNames.search, // Стартовая страница - страница поиска
          );
        },
      ),
    );
  }
}
