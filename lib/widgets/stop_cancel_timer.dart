import 'package:flutter/material.dart';

class StopCancelTimer extends StatelessWidget {
  const StopCancelTimer({
    Key? key,
    required this.stopResumeTimer,
    required this.cancelTimer,
    required this.stopResume,
  }) : super(key: key);

  final Function stopResumeTimer;
  final Function cancelTimer;
  final String stopResume;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            stopResumeTimer();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 197, 25, 97)),
            padding:
            MaterialStateProperty.all(const EdgeInsets.all(16)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
          ),
          child: Text(
            stopResume,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        ElevatedButton(
          onPressed: () {
            cancelTimer();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 197, 25, 97)),
            padding:
            MaterialStateProperty.all(const EdgeInsets.all(16)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
          ),
          child: const Text(
            "CANCEL",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ],
    );
  }
}
