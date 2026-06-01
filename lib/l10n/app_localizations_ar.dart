// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'متجري';

  @override
  String get productsTab => 'المنتجات';

  @override
  String get settingsTab => 'الإعدادات';

  @override
  String helloUser(String name) {
    return 'مرحباً، $name!';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count منتج',
      few: '3-10 منتجات',
      two: 'منتجين',
      one: 'منتج واحد',
      zero: 'لا توجد منتجات',
    );
    return '$_temp0';
  }

  @override
  String totalPrice(double price) {
    return 'الإجمالي: $price';
  }

  @override
  String addedDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'تمت الإضافة في $dateString';
  }

  @override
  String get languageLabel => 'Language';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get ukrainian => 'Ukrainian';

  @override
  String get english => 'English';

  @override
  String get polish => 'Polish';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get edit => 'تعديل';

  @override
  String get add => 'إضافة';

  @override
  String get themeMode => 'Dark Theme';

  @override
  String get logoutButton => 'Log Out';

  @override
  String get searchPlaceholder => 'بحث...';
}
