import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_bloc/ui/widgets/weather_details_screen/humidity_widget.dart';

import '../../utils/extensions.dart';

import '../../domain/bloc/weather_bloc.dart';

import '../navigation/main_navigation.dart';

import '../widgets/weather_details_screen/min_max_temp_widget.dart';
import '../widgets/weather_details_screen/feels_like_temp_widget.dart';
import '../widgets/weather_details_screen/wind_data.dart';

// Экран деталей погоды по указанному городу
class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final navigator = Navigator.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => navigator.pushReplacementNamed(RouteNames.search),
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                navigator.pushNamed(RouteNames.weatherForecast);
                weatherBloc.add(GetWeatherForecastEvent());
              },
              icon: const Icon(Icons.thermostat)),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          final weatherData = state.weatherDetails!;
          return Container(
            width: deviceSize.width,
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    weatherData.cityName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    weatherData.weatherDescription,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
                Image.network(weatherData.iconUrl),
                Text(
                  weatherData.temp.degreefy(),
                  style: const TextStyle(fontSize: 64),
                ),
                MinMaxTempWidget(weatherData: weatherData),
                FeelsLikeTempWidget(temp: weatherData.feelsLike),
                HumidityDataWidget(humidity: weatherData.humidity),
                WindDataWidget(windSpeed: weatherData.windSpeed),
                SizedBox(
                  height: deviceSize.height * 0.15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
