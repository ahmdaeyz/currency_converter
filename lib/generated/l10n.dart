// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Currency Converter`
  String get appName {
    return Intl.message(
      'Currency Converter',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Currencies`
  String get currencies {
    return Intl.message(
      'Currencies',
      name: 'currencies',
      desc: '',
      args: [],
    );
  }

  /// `Currency Converter`
  String get currencyConverter {
    return Intl.message(
      'Currency Converter',
      name: 'currencyConverter',
      desc: '',
      args: [],
    );
  }

  /// `Converter`
  String get converter {
    return Intl.message(
      'Converter',
      name: 'converter',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get internetError {
    return Intl.message(
      'Please check your internet connection',
      name: 'internetError',
      desc: '',
      args: [],
    );
  }

  /// `Not found.`
  String get contentError {
    return Intl.message(
      'Not found.',
      name: 'contentError',
      desc: '',
      args: [],
    );
  }

  /// `Something is wrong.`
  String get somethingIsWrong {
    return Intl.message(
      'Something is wrong.',
      name: 'somethingIsWrong',
      desc: '',
      args: [],
    );
  }

  /// `Forbidden access.`
  String get forbiddenAccessError {
    return Intl.message(
      'Forbidden access.',
      name: 'forbiddenAccessError',
      desc: '',
      args: [],
    );
  }

  /// `Service error.`
  String get serviceError {
    return Intl.message(
      'Service error.',
      name: 'serviceError',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure you have to chosen the base and target currencies`
  String get nothingSelected {
    return Intl.message(
      'Please make sure you have to chosen the base and target currencies',
      name: 'nothingSelected',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure you have to chosen the base currency`
  String get noBaseSelected {
    return Intl.message(
      'Please make sure you have to chosen the base currency',
      name: 'noBaseSelected',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure you have to chosen the target currency`
  String get noToSelected {
    return Intl.message(
      'Please make sure you have to chosen the target currency',
      name: 'noToSelected',
      desc: '',
      args: [],
    );
  }

  /// `Inputted amount is invalid`
  String get invalidAmount {
    return Intl.message(
      'Inputted amount is invalid',
      name: 'invalidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Convert`
  String get convert {
    return Intl.message(
      'Convert',
      name: 'convert',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amountHint {
    return Intl.message(
      'Amount',
      name: 'amountHint',
      desc: '',
      args: [],
    );
  }

  /// `Base currency`
  String get baseCurrency {
    return Intl.message(
      'Base currency',
      name: 'baseCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Target currency`
  String get targetCurrency {
    return Intl.message(
      'Target currency',
      name: 'targetCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure chosen currencies are different`
  String get invalidEqualSelection {
    return Intl.message(
      'Please make sure chosen currencies are different',
      name: 'invalidEqualSelection',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Common`
  String get common {
    return Intl.message(
      'Common',
      name: 'common',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get appLanguage {
    return Intl.message(
      'English',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Historical Data`
  String get historicalData {
    return Intl.message(
      'Historical Data',
      name: 'historicalData',
      desc: '',
      args: [],
    );
  }

  /// `Base Currency`
  String get historicalDataBaseCurrency {
    return Intl.message(
      'Base Currency',
      name: 'historicalDataBaseCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, Try changing the base currency from Settings`
  String get errorGettingBaseCurrency {
    return Intl.message(
      'Something went wrong, Try changing the base currency from Settings',
      name: 'errorGettingBaseCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Last Seven days`
  String get lastSevenDays {
    return Intl.message(
      'Last Seven days',
      name: 'lastSevenDays',
      desc: '',
      args: [],
    );
  }

  /// `Historical data can't be display for a currency if it is the base currency`
  String get canNotShowHistoricalDataForBase {
    return Intl.message(
      'Historical data can\'t be display for a currency if it is the base currency',
      name: 'canNotShowHistoricalDataForBase',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
