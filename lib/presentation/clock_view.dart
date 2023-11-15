import 'package:flip_board/flip_clock.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/common/providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 70.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<AppStateProvider>(
            builder: (context, state, _) {
              return FlipClock(
                digitSize: 250.0,
                showSeconds: false,
                borderRadius: BorderRadius.circular(16.0),
                flipCurve: Curves.easeInOut,
                width: 200.0,
                height: 400.0,
                hingeWidth: 3,
              );
            },
          ),
        ],
      ),
    );
  }
}
