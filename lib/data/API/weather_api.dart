import '../../domain/models/weather_details.dart';

import '../service/api_service.dart';

// Данный сервис имеет два метода: получение деталей о погоде в
// указанном городе и получение прогноза погоды на следующие 3 дня

class WeatherApi {
  static final _client = ApiService.init();

  // Метод получения деталей о погоде
  Future<WeatherDetails> getWeatherDetails(String cityName) async {
    final response = await _client.request(
      '/data/2.5/weather',
      queryParameters: {
        'q': cityName,
      },
    );

    if (response.statusCode == 200) {
      // print(response.data);
      return WeatherDetails.fromMap(response.data);
    } else if (response.statusCode == 404) {
      throw Exception('Город с таким именем не найден');
    } else {
      throw Exception('Не удалось получить данные о погоде');
    }
  }

  // Метод получения прогноза погоды на ближайшие 3 дня
  Future<List<WeatherDetails>> getWeatherForecast(String cityName) async {
    final response = await _client.request(
      '/data/2.5/forecast',
      queryParameters: {
        'q': cityName,
        'cnt': 24,
      },
    );

    // Идёт расчёт на то, что в запросе будет массив из 24 записей
    // 24 записи по 3х-часовому прогнозу == прогноз на 3 дня
    if (response.statusCode == 200) {
      final List<WeatherDetails> forecastList = (response.data['list'] as List)
          .map((weatherObj) => WeatherDetails.fromMap(weatherObj))
          .toList();
      forecastList.sort((a, b) =>
          a.temp.compareTo(b.temp)); // Сортируем по температуре, п. 3 задания
      return forecastList;
    } else {
      throw Exception('Не удалось получить данные о прогнозе погоды');
    }
  }
}
