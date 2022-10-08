import '../../utils/extensions.dart';

// Модель деталей о погоде
class WeatherDetails {
  final String cityName;
  final DateTime timeStamp;
  final String weatherDescription;
  final String iconUrl;
  final double temp;
  final double feelsLike;
  final int humidity;
  final double windSpeed;

  WeatherDetails({
    required this.cityName,
    required this.timeStamp,
    required this.weatherDescription,
    required this.iconUrl,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
  });

  // Единственный метод конвертации из мапы, так как больше никаких действий
  // с объектом не осуществляем после получения данных
  factory WeatherDetails.fromJson(Map<String, dynamic> map) {
    return WeatherDetails(
      cityName: map['name'] as String? ?? '',
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['dt'] as int? ?? 0),
      weatherDescription:
          (map['weather'][0]['description'] as String).capitalize(),
      iconUrl:
          'http://openweathermap.org/img/wn/${map['weather'][0]['icon']}@2x.png',
      temp: map['main']['temp'] as double,
      feelsLike: map['main']['feels_like'] as double,
      humidity: map['main']['humidity'] as int,
      windSpeed: map['wind']['speed'] as double,
    );
  }

  @override
  String toString() {
    return '''WeatherDetails(cityName: $cityName,
                             timeStamp: $timeStamp,
                             weatherDescription: $weatherDescription, 
                             iconUrl: $iconUrl, temp: $temp, 
                             feelsLike: $feelsLike, 
                             humidity: $humidity, 
                             windSpeed: $windSpeed)''';
  }
}