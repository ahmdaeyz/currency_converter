import 'dart:convert';
import 'dart:math';

import 'package:currency_converter/core/application/constants/cache_keys.dart';
import 'package:currency_converter/core/data/data_sources/cache_data_source.dart';
import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';
import 'package:currency_converter/features/currencies/data/services/realm_currency_storage_service.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realm/realm.dart';

class MockCacheDataSource extends Mock implements CacheDataSource {}

String _generateRandomRealmName(int len) {
  final r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final nameBase =
      List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  return '$nameBase.realm';
}

main() {
  late CacheDataSource cacheDataSource;
  Realm? realm;

  setUp(() {
    cacheDataSource = MockCacheDataSource();
    Configuration.defaultRealmName = _generateRandomRealmName(50);
    realm = Realm(
        Configuration.inMemory([ExchangeRate.schema, StorableCurrency.schema]));
  });

  tearDown(() {
    final realmPath = realm?.config.path;
    realm?.close();
    Realm.deleteRealm(realmPath ?? "");

    resetMocktailState();
  });

  test("test gets the enc key from cache if it exists", () {
    fakeAsync((async) {
      final encKey =
          base64Encode(List<int>.generate(64, (i) => Random().nextInt(256)));
      when(() => cacheDataSource.putString(
          key: CacheKeys.encryption,
          value: any(named: "value"))).thenAnswer((invocation) {});
      when(() => cacheDataSource.getString(
            key: CacheKeys.encryption,
          )).thenAnswer((invocation) async => encKey);

      final service = RealmCurrencyStorageService(cacheDataSource);

      verify(() => cacheDataSource.getString(key: CacheKeys.encryption))
          .called(1);
      verifyNever(() =>
          cacheDataSource.putString(key: CacheKeys.encryption, value: encKey));

      service.cleanUp();
    });
  });

  test("test saves the enc to cache if it doesn't exist", () {
    fakeAsync((async) {
      when(() => cacheDataSource.putString(
          key: CacheKeys.encryption,
          value: any(named: "value"))).thenAnswer((invocation) {});

      when(() => cacheDataSource.getString(
            key: CacheKeys.encryption,
          )).thenAnswer((invocation) async => null);

      final service = RealmCurrencyStorageService(cacheDataSource);
      async.flushTimers();

      verify(() => cacheDataSource.getString(key: CacheKeys.encryption))
          .called(1);

      verify(() => cacheDataSource.putString(
          key: CacheKeys.encryption, value: any(named: "value"))).called(1);
      service.cleanUp();
    });
  });

  test("test saveCurrencies saves the currencies in the realm", () {
    fakeAsync((async) {
      final service =
          RealmCurrencyStorageService(cacheDataSource, realm: realm);
      final currencies = [StorableCurrency("USD", "\$", "Dollar")];
      service.saveCurrencies(currencies: currencies);
      async.flushTimers();
      final currenciesInTheRealm = realm?.all<StorableCurrency>();
      expect(currenciesInTheRealm?.isNotEmpty, true);
      expect(currenciesInTheRealm?.length, currencies.length);
    });
  });

  test(
      "test saveExchangeRates saves the rates in the realm if the currency exists",
      () {
    fakeAsync((async) {
      final service =
          RealmCurrencyStorageService(cacheDataSource, realm: realm);
      final rates = [ExchangeRate("EUR", 1)];

      // Make it exist
      realm?.write(() {
        realm?.add(StorableCurrency("USD", "\$", "Dollar"));
      });

      // Save the rates
      service.saveExchangeRates(code: "USD", rates: rates);
      async.flushTimers();
      final currencyInTheRealm = realm?.find<StorableCurrency>("USD");
      expect(currencyInTheRealm?.rates.isNotEmpty, true);
      expect(currencyInTheRealm?.rates.length, rates.length);
    });
  });

  test("test saveExchangeRates does nothing if the currency doesn't exist", () {
    fakeAsync((async) {
      final service =
          RealmCurrencyStorageService(cacheDataSource, realm: realm);
      final rates = [ExchangeRate("EUR", 1)];

      // save the rates
      service.saveExchangeRates(code: "USD", rates: rates);
      async.flushTimers();
      final currencyInTheRealm = realm?.find<StorableCurrency>("USD");
      expect(currencyInTheRealm?.rates.isNotEmpty, null);
      expect(currencyInTheRealm?.rates.length, null);
    });
  });

  test("test getCurrencies returns the available currencies in the realm", () {
    final service = RealmCurrencyStorageService(cacheDataSource, realm: realm);
    realm?.write(() {
      realm?.add(StorableCurrency("USD", "\$", "Dollar"));
    });
    final availableCurrencies = service.getCurrencies();
    expect(availableCurrencies.length, 1);
    expect(availableCurrencies.isNotEmpty, true);
  });

  test(
      "test getRate returns the rate if it and its currency exists in the realm",
      () {
    fakeAsync((async) {
      final service =
          RealmCurrencyStorageService(cacheDataSource, realm: realm);
      final eurRate = ExchangeRate("EUR", 1);
      realm?.write(() {
        final currency = StorableCurrency("USD", "\$", "Dollar");
        realm?.add(currency);
        currency.rates.add(ExchangeRate("USD_EUR", 1));
      });
      final rate = service.getRate(base: "USD", to: "EUR");
      async.flushTimers();
      expect(rate?.code, eurRate.code);
      expect(rate?.rate, eurRate.rate);
    });
  });

  test("test returns null if its currency or it doesn't exist in the realm",
      () {
    fakeAsync((async) {
      final service =
          RealmCurrencyStorageService(cacheDataSource, realm: realm);

      final rate = service.getRate(base: "USD", to: "EUR");
      async.flushTimers();
      expect(rate, null);
    });
  });
}
