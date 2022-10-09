import 'package:flutter/material.dart';

class TempColumn extends StatelessWidget {
  final String desc;
  final String temp;
  const TempColumn({Key? key, required this.desc, required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(desc),
          Text(temp),
        ],
      ),
    );
  }
}
