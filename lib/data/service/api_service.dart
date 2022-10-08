import 'package:dio/dio.dart';
import '../../config/config.dart';

// Работаем через библиотеку Dio с OpenWeather API
class ApiService {
  static Dio init() {
    final BaseOptions options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: 6000,
      receiveTimeout: 4000,
      method: 'GET',
      responseType: ResponseType.json,
      queryParameters: {
        'appid': Config.apiKey,
        'units': Config.unitsSystem,
        'lang': Config.responseLang,
      },
    );
    return Dio(options);
  }
}
