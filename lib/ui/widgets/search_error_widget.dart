import 'package:flutter/material.dart';

class SearchError extends StatelessWidget {
  final String text;
  const SearchError({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Color.fromARGB(255, 245, 139, 139),
          child: Icon(Icons.warning_rounded, size: 50),
        ),
        Text(
          text,
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
