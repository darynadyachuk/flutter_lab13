// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Mój Sklep';

  @override
  String get productsTab => 'Produkty';

  @override
  String get settingsTab => 'Ustawienia';

  @override
  String helloUser(String name) {
    return 'Cześć, $name!';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count produktów',
      few: '$count produkty',
      one: '1 produkt',
      zero: 'Brak produktów',
    );
    return '$_temp0';
  }

  @override
  String totalPrice(double price) {
    final intl.NumberFormat priceNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
    );
    final String priceString = priceNumberFormat.format(price);

    return 'Suma: $priceString';
  }

  @override
  String addedDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Dodano: $dateString';
  }

  @override
  String get languageLabel => 'Język';

  @override
  String get selectLanguage => 'Wybierz język';

  @override
  String get ukrainian => 'Ukraiński';

  @override
  String get english => 'Angielski';

  @override
  String get polish => 'Polski';

  @override
  String get save => 'Zapisz';

  @override
  String get cancel => 'Anuluj';

  @override
  String get delete => 'Usuń';

  @override
  String get edit => 'Edytuj';

  @override
  String get add => 'Dodaj';

  @override
  String get themeMode => 'Ciemny motyw';

  @override
  String get logoutButton => 'Wyloguj się';

  @override
  String get searchPlaceholder => 'Szukaj produktów...';
}
