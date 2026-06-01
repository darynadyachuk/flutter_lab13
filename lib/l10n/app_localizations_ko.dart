// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '내 상점';

  @override
  String get productsTab => '상품';

  @override
  String get settingsTab => '설정';

  @override
  String helloUser(String name) {
    return '안녕하세요, $name님!';
  }

  @override
  String itemsCount(int count) {
    return '상품 $count개';
  }

  @override
  String totalPrice(double price) {
    return '총액: $price';
  }

  @override
  String addedDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString에 추가됨';
  }

  @override
  String get languageLabel => 'Language';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get ukrainian => 'Ukrainian';

  @override
  String get english => 'English';

  @override
  String get polish => 'Polish';

  @override
  String get save => '저장';

  @override
  String get cancel => '취소';

  @override
  String get delete => '삭제';

  @override
  String get edit => '수정';

  @override
  String get add => '추가';

  @override
  String get themeMode => 'Dark Theme';

  @override
  String get logoutButton => 'Log Out';

  @override
  String get searchPlaceholder => '검색...';
}
