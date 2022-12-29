import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stopwatch_app/widgets/start_timer_button.dart';
import 'package:stopwatch_app/widgets/stop_cancel_timer.dart';
import 'package:stopwatch_app/widgets/time_column.dart';

class StopwatchApp extends StatefulWidget {
  const StopwatchApp({Key? key}) : super(key: key);

  @override
  State<StopwatchApp> createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  Timer? repeatedFunction;
  Duration duration = const Duration(seconds: 0);
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimeColumn(
                duration: duration.inHours.toString().padLeft(2, "0"),
                timeValue: "Hours",
              ),
              TimeColumn(
                duration:
                    duration.inMinutes.remainder(60).toString().padLeft(2, "0"),
                timeValue: "minutes",
              ),
              TimeColumn(
                duration:
                    duration.inSeconds.remainder(60).toString().padLeft(2, "0"),
                timeValue: "Seconds",
              ),
            ],
          ),
          const SizedBox(
            height: 55,
          ),
          isRunning
              ? StopCancelTimer(
                  stopResumeTimer: stopResumeTimer,
                  cancelTimer: cancelTimer,
                  stopResume:
                      (repeatedFunction!.isActive) ? "STOP TIMER" : "Resume",
                )
              : StartTimerButton(
                  startTimer: startTimer,
                  changeState: changeState,
                )
        ],
      ),
    );
  }

  startTimer() {
    repeatedFunction = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int newSeconds = duration.inSeconds + 1;
        duration = Duration(seconds: newSeconds);
      });
    });
  }

  changeState() {
    setState(() {
      isRunning = true;
    });
  }

  stopResumeTimer() {
    if (repeatedFunction!.isActive) {
      setState(() {
        repeatedFunction!.cancel();
      });
    } else {
      startTimer();
    }
  }

  cancelTimer() {
    repeatedFunction!.cancel();
    setState(() {
      duration = const Duration(seconds: 0);
      isRunning = false;
    });
  }
}
