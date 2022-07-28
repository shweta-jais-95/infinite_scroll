import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infinite_scroll/components/common_components.dart';
import 'package:infinite_scroll/components/text_with_icon.dart';
import 'package:infinite_scroll/ops/common_ops.dart';
import 'package:infinite_scroll/utils/constants.dart';
import 'package:infinite_scroll/utils/fontsizes.dart';
import 'package:infinite_scroll/utils/hive_utility.dart';
import 'package:infinite_scroll/utils/palette.dart';
import 'package:infinite_scroll/utils/strings.dart';
import 'package:infinite_scroll/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await hiveUtility.openBox();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var widgetKey = Key(CommonOps.generateId([]));
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
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final themeKey = Key(Strings.theme);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            fetchAppBar(Strings.appName, context, showLeading: false, actions: [
          PopupMenuButton<TextWithIcon>(
              tooltip: Strings.options,
              splashRadius: 4,
              icon:
                  Icon(Icons.more_vert, color: Palette.primaryColor, size: 24),
              onSelected: (value) {
                if (value.key == themeKey) {
                  bool isDark = hiveUtility.checkIsDarkMode();
                  hiveUtility.setThemeMode(!isDark);
                }
              },
              itemBuilder: (c) {
                return [
                  PopupMenuItem<TextWithIcon>(
                      onTap: () async {
                        Navigator.pop(c);
                        bool isDark = hiveUtility.checkIsDarkMode();
                        await hiveUtility.setThemeMode(!isDark);
                      },
                      child: TextWithIcon(
                          key: themeKey,
                          onTap: () async {
                            Navigator.pop(c);
                            bool isDark = hiveUtility.checkIsDarkMode();
                            await hiveUtility.setThemeMode(!isDark);
                          },
                          prefixIcon: Icon(
                              hiveUtility.checkIsDarkMode()
                                  ? Icons.light_mode_outlined
                                  : Icons.dark_mode_outlined,
                              size: 20,
                              color: Palette.grey50),
                          text: hiveUtility.checkIsDarkMode()
                              ? Strings.lightMode
                              : Strings.darkMode,
                          fontSize: FontSizes.body2,
                          color: Palette.textColor,
                          topMargin: 0,
                          leftMargin: 0,
                          rightMargin: 0,
                          bottomMargin: 0)),
                ];
              })
        ]),
        body: Column(
          children: <Widget>[
            TextWithIcon(
                prefixIcon: Icon(Icons.light_mode_outlined,
                    size: 20, color: Palette.grey50))
          ],
        ));
  }
}
