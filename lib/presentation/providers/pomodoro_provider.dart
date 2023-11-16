import 'package:flutter/material.dart';

enum PomodoroStep {
  pomodoro,
  shortRest,
  longRest,
}

class PomodoroProvider extends ChangeNotifier {

  int pomodoroCounter = 1;
  int shortRestCounter = 0;
  int longRestCounter = 0;

  int duration = 25;

  PomodoroStep _step = PomodoroStep.pomodoro;

  PomodoroStep get step => _step;
  set step(PomodoroStep step) {
    _step = step;
    notifyListeners();
  }

  onDone() {
    switch (step) {
      case PomodoroStep.pomodoro:
        {
          if(pomodoroCounter < 4) {
            countShortRest();
          } else {
            countLongRest();
          }
        }
      case PomodoroStep.shortRest:
        {
          countPomodoro();
        }
      case PomodoroStep.longRest:
        {
          countPomodoro();
        }
    }
  }

  init() {
    countPomodoro();
  }

  countPomodoro() {
    pomodoroCounter++;
    step = PomodoroStep.pomodoro;
    duration = 25;
    notifyListeners();
  }

  countShortRest() {
    shortRestCounter++;
    step = PomodoroStep.shortRest;
    duration = 5;
    notifyListeners();
  }

  countLongRest() {
    longRestCounter++;
    pomodoroCounter = 0;
    shortRestCounter = 0;
    step = PomodoroStep.longRest;
    duration = 15;
    notifyListeners();
  }
}
