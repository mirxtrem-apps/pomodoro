import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/theme/app_colors.dart';
import '/common/providers/app_state_provider.dart';

class AppBottomNavBar extends StatelessWidget {

  const AppBottomNavBar({ super.key });

   @override
   Widget build(BuildContext context) {
    final appState = context.read<AppStateProvider>();
       return Row(
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
      );
  }
}