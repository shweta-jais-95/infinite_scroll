import 'package:hive_flutter/hive_flutter.dart';
import 'package:infinite_scroll/utils/constants.dart';

HiveUtility hiveUtility = HiveUtility();

class HiveUtility {
  static final HiveUtility _hiveUtility = HiveUtility._internal();
  factory HiveUtility() {
    return _hiveUtility;
  }
  HiveUtility._internal();

  openBox() async {
    await Hive.openBox(HiveBoxNames.darkMode);
  }

  clear() async {
    await Hive.box(HiveBoxNames.darkMode).clear();
  }

  setThemeMode(bool isDark) async {
    Box darkMode = Hive.box(HiveBoxNames.darkMode);
    await darkMode.put(HiveBoxKeys.isDark, isDark);
  }

  bool checkIsDarkMode() {
    Box darkMode = Hive.box(HiveBoxNames.darkMode);
    return darkMode.get(HiveBoxKeys.isDark, defaultValue: false);
  }
}
