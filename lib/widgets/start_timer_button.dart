import 'package:flutter/material.dart';

class StartTimerButton extends StatelessWidget {
  const StartTimerButton({
    Key? key,
    required this.startTimer,
    required this.changeState
  }) : super(key: key);

  final Function startTimer;
  final Function changeState;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        startTimer();
        changeState();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 25, 120, 197)),
        padding:
        MaterialStateProperty.all(const EdgeInsets.all(14)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9))),
      ),
      child: const Text(
        "Start Timer",
        style: TextStyle(fontSize: 23),
      ),
    );
  }
}
