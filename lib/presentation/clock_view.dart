import 'package:flutter/material.dart';
import 'package:pomodoro/presentation/widgets/flip_clock_widget.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      alignment: Alignment.center,
      child: const FlipClockWidget(),
    );
  }
}
