part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeatherDetailsEvent extends WeatherEvent {
  final String cityName;

  GetWeatherDetailsEvent(this.cityName);
}

class GetWeatherForecastEvent extends WeatherEvent {}

class ClearWeatherDataEvent extends WeatherEvent {}
