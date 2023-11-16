import 'package:flutter/material.dart';
import 'package:flip_board/flip_clock.dart';
import 'package:pomodoro/presentation/providers/pomodoro_provider.dart';
import 'package:provider/provider.dart';

class PomodoroView extends StatelessWidget {
  const PomodoroView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PomodoroProvider(),
      child: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.symmetric(
          horizontal: 60.0,
          vertical: 70.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<PomodoroProvider>(builder: (context, prov, _) {
              return FlipCountdownClock(
                digitSize: 250.0,
                duration: Duration(minutes: prov.duration),
                flipDirection: AxisDirection.down,
                borderRadius: BorderRadius.circular(16.0),
                flipCurve: Curves.easeInOut,
                onDone: () {
                  prov.onDone();
                },
                width: 200.0,
                height: 400.0,
                hingeWidth: 3,
              );
            }),
          ],
        ),
      ),
    );
  }
}
