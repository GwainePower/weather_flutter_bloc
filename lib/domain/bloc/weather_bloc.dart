import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../models/weather_details.dart';

import '../../data/API/weather_api.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _api = WeatherApi();
  String _query = '';
  WeatherBloc() : super(const WeatherState()) {
    on<GetWeatherDetailsEvent>(_getWeatherDetailsEvent);
    on<GetWeatherForecastEvent>(_getWeatherForecastEvent);
  }

  Future<void> _getWeatherDetailsEvent(
      GetWeatherDetailsEvent event, Emitter<WeatherState> emit) async {
    emit(state.clearData());
    _query = event.cityName;
    emit(state.copyWith(isLoading: true));
    try {
      final weatherDetails = await _api.getWeatherDetails(_query);
      emit(state.copyWith(weatherDetails: weatherDetails));
    } on DioError catch (e) {
      emit(state.copyWith(
          errorCode:
              e.response == null ? '-1' : e.response!.statusCode.toString()));
    }
  }

  Future<void> _getWeatherForecastEvent(
      GetWeatherForecastEvent event, Emitter<WeatherState> emit) async {
    if (state.forecastData.isNotEmpty) return;
    emit(state.copyWith(isLoading: true));
    try {
      final weatherForecast = await _api.getWeatherForecast(_query);
      emit(state.copyWith(forecastData: weatherForecast));
    } on DioError catch (e) {
      emit(state.copyWith(
          errorCode:
              e.response == null ? '-1' : e.response!.statusCode.toString()));
    }
  }
}
