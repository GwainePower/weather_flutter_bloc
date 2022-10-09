import '../../utils/extensions.dart';

// Модель деталей о погоде
class WeatherDetails {
  final String cityName;
  final DateTime? timeStamp;
  final String weatherDescription;
  final String iconUrl;
  final num temp;
  final num tempMin;
  final num tempMax;
  final num feelsLike;
  final int humidity;
  final num windSpeed;

  WeatherDetails({
    required this.cityName,
    this.timeStamp,
    required this.weatherDescription,
    required this.iconUrl,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
  });

  // Единственный метод конвертации - из мапы, так как больше никаких действий
  // с объектом не осуществляем после получения данных,
  // DIO преобразовывает их из json в map автоматически
  factory WeatherDetails.fromMap(Map<String, dynamic> map) {
    return WeatherDetails(
      cityName: map['name'] as String? ?? '',
      timeStamp: (map['dt_txt'] as String?) == null
          ? null
          : DateTime.parse(map['dt_txt']),
      weatherDescription:
          (map['weather'][0]['description'] as String).capitalize(),
      iconUrl:
          'http://openweathermap.org/img/wn/${map['weather'][0]['icon']}@2x.png',
      temp: map['main']['temp'] as num,
      tempMin: map['main']['temp_min'] as num,
      tempMax: map['main']['temp_max'] as num,
      feelsLike: map['main']['feels_like'] as num,
      humidity: map['main']['humidity'] as int,
      windSpeed: map['wind']['speed'] as num,
    );
  }

  // Для проверки получаемого объекта
  @override
  String toString() {
    return 'Weather(city: $cityName, ts: $timeStamp, desc: $weatherDescription, icon: $iconUrl, t: $temp, feels: $feelsLike, humid: $humidity, wind: $windSpeed)';
  }
}
