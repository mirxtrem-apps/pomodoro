import 'dart:math';

import 'package:flutter/material.dart';

class DigitCard extends StatefulWidget {
  const DigitCard({Key? key}) : super(key: key);

  @override
  State<DigitCard> createState() => _DigitCardState();
}

class _DigitCardState extends State<DigitCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation =
        Tween<double>(end: -(pi), begin: -(pi * 2)).animate(_controller);

    _animation.addListener(() {
      setState(() {});
    });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 99,
              width: 200,
              color: Colors.red,
              child: const Text('12'),
            ),
            const Divider(
              height: 2,
              color: Colors.transparent,
            ),
            Container(
              height: 99,
              width: 200,
              color: Colors.blue,
              child: const Text('12'),
            ),
          ],
        ),
        AnimatedBuilder(
            animation: _animation,
            child: Container(
              height: 99,
              width: 200,
              color: Colors.yellow,
              child: const Text('12'),
            ),
            builder: (context, child) {
              return Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateX(_animation.value),
                  child: child);
            }),
      ],
    );
  }
}
