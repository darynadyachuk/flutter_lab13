class LanguageModel {
  final String code;
  final String name;
  final String flag;

  const LanguageModel({
    required this.code,
    required this.name,
    required this.flag,
  });

  static const List<LanguageModel> languages = [
    LanguageModel(code: 'uk', name: 'Українська', flag: '🇺🇦'),
    LanguageModel(code: 'en', name: 'English', flag: '🇬🇧'),
    LanguageModel(code: 'pl', name: 'Polski', flag: '🇵🇱'),
    LanguageModel(code: 'es', name: 'Español', flag: '🇪🇸'),
    LanguageModel(code: 'ar', name: 'العربية', flag: '🇸🇦'),
    LanguageModel(code: 'ko', name: '한국어', flag: '🇰🇷'),
    LanguageModel(code: 'ka', name: 'ქართული', flag: '🇬🇪'),
    LanguageModel(code: 'pt', name: 'Português', flag: '🇵🇹'),
  ];

  static LanguageModel? getByCode(String code) {
    try {
      return languages.firstWhere((lang) => lang.code == code);
    } catch (e) {
      return null;
    }
  }
}
