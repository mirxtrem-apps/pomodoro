import 'package:flutter/material.dart';
import 'package:pomodoro/common/services/user_preferences.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/common/providers/app_state_provider.dart';
import 'package:pomodoro/common/theme/app_theme.dart';
import 'package:pomodoro/presentation/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppStateProvider(
            prefs: UserPreferences(prefs),
          ),
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
