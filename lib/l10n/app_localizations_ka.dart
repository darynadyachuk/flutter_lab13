// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'ჩემი მაღაზია';

  @override
  String get productsTab => 'პროდუქტები';

  @override
  String get settingsTab => 'პარამეტრები';

  @override
  String helloUser(String name) {
    return 'გამარჯობა, $name!';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count პროდუქტი',
      one: '1 პროდუქტი',
      zero: 'პროდუქტი არ არის',
    );
    return '$_temp0';
  }

  @override
  String totalPrice(double price) {
    return 'სულ: $price';
  }

  @override
  String addedDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'დაემატა $dateString';
  }

  @override
  String get languageLabel => 'Language';

  @override
  String get selectLanguage => 'ენის არჩევა';

  @override
  String get ukrainian => 'Ukrainian';

  @override
  String get english => 'English';

  @override
  String get polish => 'Polish';

  @override
  String get save => 'შენახვა';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get delete => 'წაშლა';

  @override
  String get edit => 'რედაქტირება';

  @override
  String get add => 'დამატება';

  @override
  String get themeMode => 'Dark Theme';

  @override
  String get logoutButton => 'Log Out';

  @override
  String get searchPlaceholder => 'ძებნა...';
}
