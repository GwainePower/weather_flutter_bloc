import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/weather_bloc.dart';

import '../navigation/main_navigation.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${state.weatherDetails!.cityName} в деталях'),
            leading: IconButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(RouteNames.search),
                icon: const Icon(Icons.arrow_back)),
            actions: [
              IconButton(
                  onPressed: () {
                    weatherBloc.add(GetWeatherForecastEvent());
                  },
                  icon: const Icon(Icons.cloudy_snowing))
            ],
          ),
          body: const Text('Hello'),
        );
      },
    );
  }
}
