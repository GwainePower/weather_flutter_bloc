import 'package:flutter/material.dart';

import '../../../utils/extensions.dart';

class FeelsLikeTempWidget extends StatelessWidget {
  final num temp;
  const FeelsLikeTempWidget({Key? key, required this.temp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Ощущается как '),
        Text(temp.degreefy()),
      ],
    );
  }
}
