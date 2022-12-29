import 'package:flutter/material.dart';

class TimeColumn extends StatelessWidget {
  const TimeColumn({
    Key? key,
    required this.duration,
    required this.timeValue,
  }) : super(key: key);

  final String duration;
  final String timeValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 22),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            duration,
            style: const TextStyle(
              fontSize: 77,
            ),
          ),
        ),
        Text(
          timeValue,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ],
    );
  }
}
