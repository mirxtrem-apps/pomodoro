import 'package:flutter/material.dart';
import 'package:pomodoro/common/providers/app_state_provider.dart';
import 'package:pomodoro/presentation/clock_view.dart';
import 'package:pomodoro/presentation/pomodoro_view.dart';
import 'package:pomodoro/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:pomodoro/presentation/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();

    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        body: [
          const ClockView(),
          const PomodoroView(),
        ][appState.currentPage],
        bottomNavigationBar: const AppBottomNavBar(),
      ),
    );
  }
}
