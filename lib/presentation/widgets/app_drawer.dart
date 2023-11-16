import 'package:flutter/material.dart';
import 'package:pomodoro/common/providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Drawer(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            children: [
              const DrawerHeader(child: Offstage()),
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
      ),
    );
  }
}
