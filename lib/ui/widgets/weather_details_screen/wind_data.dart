import 'package:flutter/material.dart';

class WindDataWidget extends StatelessWidget {
  final num windSpeed;
  const WindDataWidget({Key? key, required this.windSpeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 4),
          child: Icon(Icons.air_rounded),
        ),
        Text('${windSpeed.toString()} м/сек'),
      ],
    );
  }
}
