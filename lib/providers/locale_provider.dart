import 'package:flutter/material.dart';
import '../services/locale_storage_service.dart';

class LocaleProvider extends ChangeNotifier {
  final LocaleStorageService _storageService = LocaleStorageService();

  Locale _locale = const Locale('uk');
  Locale get locale => _locale;

  LocaleProvider() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final languageCode = await _storageService.getSavedLanguageCode();
      if (languageCode != null) {
        _locale = Locale(languageCode);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('❌ Помилка завантаження локалі: $e');
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;

    _locale = locale;
    notifyListeners();

    try {
      await _storageService.saveLanguageCode(locale.languageCode);
      debugPrint('✅ Language saved: ${locale.languageCode}');
    } catch (e) {
      debugPrint('❌ Помилка збереження локалі: $e');
    }
  }

  Future<void> resetLocale() async {
    _locale = const Locale('uk');
    notifyListeners();

    try {
      await _storageService.clearSavedLanguage();
    } catch (e) {
      debugPrint('❌ Помилка видалення локалі: $e');
    }
  }
}
