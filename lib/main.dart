import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll/ops/common_ops.dart';
import 'package:infinite_scroll/screens/main_screen.dart';
import 'package:infinite_scroll/utils/constants.dart';
import 'package:infinite_scroll/utils/hive_utility.dart';
import 'package:infinite_scroll/utils/palette.dart';
import 'package:infinite_scroll/utils/strings.dart';
import 'package:infinite_scroll/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await hiveUtility.openBox();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(HiveBoxNames.darkMode).listenable(),
      builder: (BuildContext context, Box? box, widget) {
        bool isDark = box?.get(HiveBoxKeys.isDark, defaultValue: false);
        Palette.setColor(isDark);
        return MaterialApp(
          title: Strings.appName,
          key: Key(CommonOps.generateId([])),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme(false),
          darkTheme: AppTheme.getTheme(true),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: const MainScreen(),
        );
      },
    );
  }
}
