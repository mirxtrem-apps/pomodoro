import 'package:flutter/material.dart';
import 'package:pomodoro/common/providers/app_state_provider.dart';
import 'package:pomodoro/common/theme/app_colors.dart';
import 'package:pomodoro/presentation/clock_view.dart';
import 'package:pomodoro/presentation/pomodoro_view.dart';
import 'package:pomodoro/presentation/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();

    return Scaffold(
      drawer: const AppDrawer(),
      body: [
        const ClockView(),
        const PomodoroView(),
      ][appState.currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              appState.jumpToPage(0);
            },
            icon: Icon(
              Icons.watch_later_outlined,
              color: appState.currentPage == 0 ? AppColors.accent : null,
            ),
          ),
          IconButton(
            onPressed: () {
              appState.jumpToPage(1);
            },
            icon: Icon(
              Icons.timer_outlined,
              color: appState.currentPage == 1 ? AppColors.accent : null,
            ),
          ),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.settings,
              ),
            );
          }),
        ],
      ),
    );
  }
}
