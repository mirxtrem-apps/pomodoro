import 'package:flutter/material.dart';
import 'package:flip_board/flip_clock.dart';

class PomodoroView extends StatelessWidget {
  const PomodoroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.symmetric(
        horizontal: 60.0,
        vertical: 70.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlipCountdownClock(
            digitSize: 250.0,
            duration: const Duration(minutes: 25),
            flipDirection: AxisDirection.down,
            borderRadius: BorderRadius.circular(16.0),
            flipCurve: Curves.easeInOut,
            onDone: () => debugPrint('Buzzzz!'),
            width: 200.0,
            height: 400.0,
            hingeWidth: 3,
          ),
        ],
      ),
    );
  }
}
