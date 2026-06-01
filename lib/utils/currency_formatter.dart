import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';

extension CurrencyFormatter on BuildContext {
  String formatPrice(double price) {
    final locale = Localizations.localeOf(this);
    final l10n = AppLocalizations.of(this)!;

    String currencySymbol = switch (locale.languageCode) {
      'uk' => '₴',
      'pl' => 'zł',
      'es' || 'pt' => '€',
      'ar' => 'د.إ',
      'ko' => '₩',
      'ka' => '₾',
      _ => '\$',
    };

    final format = NumberFormat.currency(
      locale: locale.toString(),
      symbol: currencySymbol,
      decimalDigits: 2,
    );

    final prefix = l10n.totalPrice(0.0).split(':').first;
    return '$prefix: ${format.format(price)}';
  }
}
