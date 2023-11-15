import 'package:flutter/material.dart';
import 'package:pomodoro/common/providers/app_state_provider.dart';
import 'package:pomodoro/presentation/clock_view.dart';
import 'package:pomodoro/presentation/pomodoro_view.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final pageController = PageController(
      initialPage: currentPage,
    );
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark mode'),
              value: appState.isDark,
              onChanged: (mode) {
                appState.setThemeMode();
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          ClockView(),
          PomodoroView(),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (currentPage == 2)
            IconButton(
              onPressed: () {
                setState(() => currentPage = 1);
                pageController.jumpToPage(0);
              },
              icon: const Icon(
                Icons.watch_later_outlined,
              ),
            )
          else
            IconButton(
              onPressed: () {
                setState(() => currentPage = 2);
                pageController.jumpToPage(1);
              },
              icon: const Icon(
                Icons.timer_outlined,
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
