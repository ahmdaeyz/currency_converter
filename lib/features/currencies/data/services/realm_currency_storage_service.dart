import 'dart:convert';
import 'dart:math';

import 'package:currency_converter/core/application/constants/cache_keys.dart';
import 'package:currency_converter/core/data/data_sources/cache_data_source.dart';
import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';
import 'package:currency_converter/features/currencies/data/services/currency_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';

@Singleton(as: CurrencyStorageService)
class RealmCurrencyStorageService implements CurrencyStorageService {
  Realm? _realm;
  final CacheDataSource _cacheDataSource;

  RealmCurrencyStorageService(this._cacheDataSource, {Realm? realm}) {
    if (realm != null) {
      _realm = realm;
    } else {
      _createOrOpenTheRealm();
    }
  }

  @override
  List<StorableCurrency> getCurrencies() {
    final currencies = _realm?.all<StorableCurrency>();
    if (currencies?.isNotEmpty ?? false) {
      return currencies?.toList() ?? [];
    }
    return [];
  }

  @override
  ExchangeRate? getRate({required String base, required String to}) {
    final currency = _realm?.find<StorableCurrency>(base);
    if (currency != null) {
      if (currency.rates.isNotEmpty) {
        final toCurrencyRate = _realm?.find<ExchangeRate>("${base}_$to");
        if (toCurrencyRate != null) {
          final to = toCurrencyRate.code.split("_").last;
          return ExchangeRate(to, toCurrencyRate.rate);
        }
      }
    }
    return null;
  }

  @override
  void saveCurrencies({required List<StorableCurrency> currencies}) {
    _realm?.write(() {
      _realm?.addAll(currencies);
    });
  }

  @override
  void saveExchangeRates(
      {required String code, required List<ExchangeRate> rates}) {
    final currency = _realm?.find<StorableCurrency>(code);
    final encodedRates =
        rates.map((e) => ExchangeRate("${code}_${e.code}", e.rate));
    if (currency != null) {
      _realm?.write(() {
        currency.rates.clear();
        currency.rates.addAll(encodedRates);
      });
    }
  }

  @override
  void clear() {
    _realm?.deleteAll();
  }

  Future<List<int>> _getEncryptionKey() async {
    final key = await _cacheDataSource.getString(key: CacheKeys.encryption);
    if (key != null) {
      final decodedKey = base64Decode(key).toList();
      return decodedKey;
    } else {
      final generatedKey = List<int>.generate(64, (i) => Random().nextInt(256));
      _cacheDataSource.putString(
          key: CacheKeys.encryption, value: base64Encode(generatedKey));
      return generatedKey;
    }
  }

  void _createOrOpenTheRealm() async {
    final encKey = await _getEncryptionKey();
    Configuration.defaultRealmName = "default";
    _realm = Realm(Configuration.local(
        [StorableCurrency.schema, ExchangeRate.schema],
        encryptionKey: encKey));
  }

  @override
  void cleanUp() {
    _realm?.close();
    Realm.deleteRealm(_realm?.config.path ?? "");
  }
}
