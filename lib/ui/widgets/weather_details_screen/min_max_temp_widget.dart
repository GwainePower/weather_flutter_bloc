import 'package:flutter/material.dart';

import '../../../utils/extensions.dart';

import '../../../domain/models/weather_details.dart';

import 'temp_column.dart';

class MinMaxTempWidget extends StatelessWidget {
  final WeatherDetails weatherData;
  const MinMaxTempWidget({Key? key, required this.weatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: deviceSize.height * 0.07,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TempColumn(
            desc: 'мин',
            temp: weatherData.tempMin.degreefy(),
          ),
          const VerticalDivider(
            color: Colors.grey,
          ),
          TempColumn(
            desc: 'макс',
            temp: weatherData.tempMax.degreefy(),
          ),
        ],
      ),
    );
  }
}
