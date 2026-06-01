// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Мій Магазин';

  @override
  String get productsTab => 'Товари';

  @override
  String get settingsTab => 'Налаштування';

  @override
  String helloUser(String name) {
    return 'Привіт, $name!';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count товарів',
      few: '$count товари',
      one: '1 товар',
      zero: 'Немає товарів',
    );
    return '$_temp0';
  }

  @override
  String totalPrice(double price) {
    final intl.NumberFormat priceNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
    );
    final String priceString = priceNumberFormat.format(price);

    return 'Всього: $priceString';
  }

  @override
  String addedDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Додано: $dateString';
  }

  @override
  String get languageLabel => 'Мова';

  @override
  String get selectLanguage => 'Виберіть мову';

  @override
  String get ukrainian => 'Українська';

  @override
  String get english => 'Англійська';

  @override
  String get polish => 'Польська';

  @override
  String get save => 'Зберегти';

  @override
  String get cancel => 'Скасувати';

  @override
  String get delete => 'Видалити';

  @override
  String get edit => 'Редагувати';

  @override
  String get add => 'Додати';

  @override
  String get themeMode => 'Темна тема';

  @override
  String get logoutButton => 'Вийти з акаунта';

  @override
  String get searchPlaceholder => 'Пошук товарів...';
}
