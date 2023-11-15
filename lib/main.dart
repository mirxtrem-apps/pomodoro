import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/common/providers/app_state_provider.dart';
import 'package:pomodoro/common/theme/app_theme.dart';
import 'package:pomodoro/presentation/pages/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppStateProvider(),
        ),
      ],
      child: Consumer<AppStateProvider>(builder: (context, theme, _) {
        return MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
          home: const MainPage(),
        );
      }),
    );
  }
}
