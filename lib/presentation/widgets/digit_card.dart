import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DigitCard extends StatefulWidget {
  const DigitCard({
    Key? key,
    required this.onTime,
    required this.timerDuration,
    required this.limit,
    required this.start,
    this.color,
    this.fontSize,
    this.height,
    this.width,
  }) : super(key: key);

  final Color? color;
  final double? fontSize;
  final double? height;
  final double? width;

  final int onTime;
  final Duration timerDuration;
  final int limit;
  final int start;

  @override
  State<DigitCard> createState() => _DigitCardState();
}

class _DigitCardState extends State<DigitCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  Timer? _timer;
  late int _clockCount;

  @override
  void initState() {
    _clockCount = widget.onTime;
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation =
        Tween<double>(end: -(pi), begin: -(pi * 2)).animate(_controller);

    _animation.addListener(() {
      setState(() {});
    });

    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUpperCard(
              text: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 7,
                    child: _clockTimerWidget(),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.transparent,
            ),
            _buildLowerCard(
              text: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -95,
                    child: _clockTimerWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
        AnimatedBuilder(
          animation: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildUpperCard(
                text: Stack(
                  alignment: Alignment.center,
                  children: [
                    _animation.value < -4.71
                        ? Positioned(
                            top: 7,
                            child: _clockTimerWidget(),
                          )
                        : Positioned(
                            top: 195,
                            child: Transform(
                                transform: Matrix4.rotationX(pi),
                                child: _clockTimerWidget()),
                          )
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.transparent,
              ),
            ],
          ),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(_animation.value),
              child: child,
            );
          },
        ),
      ],
    );
  }

  _buildUpperCard({required Widget text}) {
    return Container(
      height: widget.height ?? 100,
      width: widget.width ?? 200,
      decoration: BoxDecoration(
        color: widget.color ?? Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: text,
    );
  }

  _buildLowerCard({required Widget text}) {
    return Container(
      height: widget.height ?? 100,
      width: widget.width ?? 200,
      decoration: BoxDecoration(
        color: widget.color ?? Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: text,
    );
  }

  _startTimer() {
    Duration flipperDuration = widget.timerDuration;
    _timer = Timer.periodic(flipperDuration, (timer) {
      if (_clockCount != widget.limit) {
        _controller.reset();
        setState(() => _clockCount++);
        _controller.forward();
      } else {
        setState(() => _clockCount = widget.start);
      }
    });
  }

  Widget _clockTimerWidget() {
    return Text(
      _clockCount.toString().padLeft(2, "0"),
      style: TextStyle(
        fontSize: 150,
        color: Theme.of(context).colorScheme.onPrimary
      ),
    );
  }
}

// sec => 59
// min => 59
// hour => 12/24