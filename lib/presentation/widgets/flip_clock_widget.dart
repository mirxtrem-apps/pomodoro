import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/presentation/widgets/digit_card.dart';

class FlipClockWidget extends StatefulWidget {
  const FlipClockWidget({super.key});

  @override
  State<FlipClockWidget> createState() => _FlipClockWidgetState();
}

class _FlipClockWidgetState extends State<FlipClockWidget> {
  static DateTime _currentDateTime = DateTime.now();

  late StreamSubscription<DateTime> _subs;

  final Stream<DateTime> _timer =
      Stream.periodic(const Duration(seconds: 1), (i) {
    _currentDateTime = _currentDateTime.add(const Duration(seconds: 1));
    return _currentDateTime;
  });

  _listenToTime() {
    _subs = _timer.listen((DateTime date) {
      _currentDateTime = DateTime.parse(date.toString());
    });
  }

  @override
  void initState() {
    _listenToTime();
    super.initState();
  }

  @override
  void dispose() {
    _subs.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, layout) {
      if (layout == Orientation.landscape) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildChildrens(),
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildChildrens(),
        );
      }
    });
  }

  _buildChildrens() {
    return [
      // Hours
      DigitCard(
        onTime: _currentDateTime.hour,
        timerDuration: Duration(minutes: 60 - _currentDateTime.minute),
        limit: 12,
        start: 00,
      ),
      const SizedBox(
        width: 30.0,
        height: 30.0,
      ),
      // Minutess
      DigitCard(
        onTime: _currentDateTime.minute,
        timerDuration: Duration(seconds: 60 - _currentDateTime.second),
        limit: 59,
        start: 00,
      ),
      // // Seconds
      // DigitCard(
      //   onTime: _currentDateTime.second,
      //   timerDuration: const Duration(seconds: 1),
      //   limit: 59,
      //   start: 00,
      // ),
    ];
  }
}
