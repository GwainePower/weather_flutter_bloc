import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/bloc/weather_bloc.dart';

import '../../utils/extensions.dart';

import '../widgets/search_error_widget.dart';
import '../widgets/loading_widget.dart';

// Экран прогноза погоды по указанному городу.
// Список отсортирован по возрастанию температуры
class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final cityName = state.weatherDetails!.cityName;
        return Scaffold(
          appBar: AppBar(
            title: Text(cityName),
          ),
          body: state.isLoading
              ? const LoadingWidget()
              : state.errorCode.isNotEmpty
                  ? Center(child: SearchError(errorCode: state.errorCode))
                  : ListView.separated(
                      itemBuilder: (context, i) {
                        final forecastData = state.forecastData[i];
                        return ListTile(
                          leading: CircleAvatar(
                            foregroundImage: NetworkImage(forecastData.iconUrl),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(forecastData.weatherDescription),
                          subtitle: Text(
                            DateFormat('dd.MM.yyyy hh:mm')
                                .format(forecastData.timeStamp!),
                          ),
                          trailing: Text(forecastData.temp.degreefy()),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.forecastData.length,
                    ),
        );
      },
    );
  }
}
