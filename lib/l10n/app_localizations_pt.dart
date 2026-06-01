// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Minha Loja';

  @override
  String get productsTab => 'Produtos';

  @override
  String get settingsTab => 'Configurações';

  @override
  String helloUser(String name) {
    return 'Olá, $name!';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count produtos',
      one: '1 produto',
      zero: 'Nenhum produto',
    );
    return '$_temp0';
  }

  @override
  String totalPrice(double price) {
    return 'Total: $price';
  }

  @override
  String addedDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Adicionado em $dateString';
  }

  @override
  String get languageLabel => 'Language';

  @override
  String get selectLanguage => 'Selecionar idioma';

  @override
  String get ukrainian => 'Ukrainian';

  @override
  String get english => 'English';

  @override
  String get polish => 'Polish';

  @override
  String get save => 'Salvar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Excluir';

  @override
  String get edit => 'Editar';

  @override
  String get add => 'Adicionar';

  @override
  String get themeMode => 'Dark Theme';

  @override
  String get logoutButton => 'Log Out';

  @override
  String get searchPlaceholder => 'Buscar...';
}
