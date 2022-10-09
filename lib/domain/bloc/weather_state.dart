part of 'weather_bloc.dart';

@immutable
class WeatherState {
  final WeatherDetails? weatherDetails;
  final List<WeatherDetails> forecastData;
  final bool isLoading;
  final String errorMessage;

  const WeatherState({
    this.weatherDetails,
    this.forecastData = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  WeatherState copyWith({
    WeatherDetails? weatherDetails,
    List<WeatherDetails>? forecastData,
    bool isLoading = false,
    String errorMessage = '',
  }) {
    return WeatherState(
      weatherDetails: weatherDetails ?? this.weatherDetails,
      forecastData: forecastData ?? this.forecastData,
      isLoading: isLoading,
      errorMessage: errorMessage,
    );
  }

  WeatherState clearData() {
    return const WeatherState();
  }
}
