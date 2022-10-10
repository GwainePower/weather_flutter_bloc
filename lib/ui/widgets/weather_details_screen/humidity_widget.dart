import 'package:flutter/material.dart';

class HumidityDataWidget extends StatelessWidget {
  final int humidity;
  const HumidityDataWidget({Key? key, required this.humidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: Icon(Icons.shower_rounded),
          ),
          Text('${humidity.toString()}%'),
        ],
      ),
    );
  }
}
