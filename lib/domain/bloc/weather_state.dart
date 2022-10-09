part of 'weather_bloc.dart';

@immutable
class WeatherState {
  final WeatherDetails? weatherDetails;
  final List<WeatherDetails> forecastData;
  final bool isLoading;
  final String errorCode;

  const WeatherState({
    this.weatherDetails,
    this.forecastData = const [],
    this.isLoading = false,
    this.errorCode = '',
  });

  WeatherState copyWith({
    WeatherDetails? weatherDetails,
    List<WeatherDetails>? forecastData,
    bool isLoading = false,
    String errorCode = '',
  }) {
    return WeatherState(
      weatherDetails: weatherDetails ?? this.weatherDetails,
      forecastData: forecastData ?? this.forecastData,
      isLoading: isLoading,
      errorCode: errorCode,
    );
  }

  WeatherState clearData() => const WeatherState();
}
