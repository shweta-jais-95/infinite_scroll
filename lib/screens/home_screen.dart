import 'package:flutter/material.dart';
import 'package:infinite_scroll/components/common_components.dart';
import 'package:infinite_scroll/components/text_with_icon.dart';
import 'package:infinite_scroll/utils/fontsizes.dart';
import 'package:infinite_scroll/utils/hive_utility.dart';
import 'package:infinite_scroll/utils/palette.dart';
import 'package:infinite_scroll/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
