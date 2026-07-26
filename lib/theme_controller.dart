import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class ThemeController extends ChangeNotifier {
  ThemeController(this._settingsBox)
    : _themeMode = _readThemeMode(_settingsBox);

  static const String _storageKey = 'theme_mode';

  final Box<dynamic> _settingsBox;

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) {
      return;
    }

    _themeMode = mode;
    notifyListeners();

    await _settingsBox.put(_storageKey, _modeToStorageValue(mode));
  }

  static ThemeMode _readThemeMode(Box<dynamic> box) {
    final dynamic savedValue = box.get(_storageKey, defaultValue: 'system');

    switch (savedValue) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static String _modeToStorageValue(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
