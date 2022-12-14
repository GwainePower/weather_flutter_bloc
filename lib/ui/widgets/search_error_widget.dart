import 'package:flutter/material.dart';

class SearchError extends StatelessWidget {
  final String errorCode;
  const SearchError({
    Key? key,
    required this.errorCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Color.fromARGB(255, 100, 56, 56),
          child: Icon(
            Icons.warning_rounded,
            size: 50,
            color: Colors.white,
          ),
        ),
        Text(
          'Ошибка получения данных. Код $errorCode',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 39, 24),
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
