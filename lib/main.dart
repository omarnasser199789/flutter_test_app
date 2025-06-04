import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'injection_container.dart' as di;
import 'Theme/theme_values.dart';
import 'features/get_started/get_started_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Flutter Test App',
            debugShowCheckedModeBanner: false,
            themeMode: currentMode,
            theme: AppTheme.getLightTheme(),
            home: const GetStartedPage(),
          );
        });
  }
}
