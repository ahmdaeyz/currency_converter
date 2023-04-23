import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:currency_converter/core/application/constants/cache_keys.dart';
import 'package:currency_converter/core/application/locale/locale_state.dart';
import 'package:currency_converter/core/data/data_sources/cache_data_source.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

const englishLocale = Locale("en");
const arabicLocale = Locale("ar");

@lazySingleton
class LocaleCubit extends Cubit<LocaleState> {
  final CacheDataSource _cache;

  LocaleCubit({required CacheDataSource cache})
      : _cache = cache,
        super(const LocaleState.initial(locale: englishLocale));

  final List<Locale> supportedLocales =
      List.from([englishLocale, arabicLocale], growable: false);

  /// Side Effect: Emits the current locale
  Future<Locale> getCurrentLocale() async {
    Locale? locale;
    final localeAsString = await _cache.getString(key: CacheKeys.language);
    if (localeAsString != null) {
      locale = Locale.fromSubtags(languageCode: localeAsString);
    } else {
      final currentDeviceLocale = Platform.localeName;
      if (_isCurrentDeviceLocaleSupported(currentDeviceLocale)) {
        locale = Locale.fromSubtags(languageCode: currentDeviceLocale);
        _saveLocale(locale);
      }
    }

    emit(LocaleState.changed(locale: locale!));
    return locale;
  }

  void switchLocale() {
    if (state.locale == englishLocale) {
      emit(const LocaleState.changed(locale: arabicLocale));
      _saveLocale(state.locale);
    } else {
      emit(const LocaleState.changed(locale: englishLocale));
      _saveLocale(state.locale);
    }
  }

  _saveLocale(Locale locale) {
    _cache.putString(key: CacheKeys.language, value: locale.languageCode);
  }

  bool _isCurrentDeviceLocaleSupported(String name) {
    if (name == "en" || name == "ar") {
      return true;
    }
    return false;
  }
}
