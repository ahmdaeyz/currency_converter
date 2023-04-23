import 'package:clock/clock.dart';
import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/data/data_sources/env_variables.dart';
import 'package:currency_converter/features/currencies/data/data_sources/currencies_local_data_source.dart';
import 'package:currency_converter/features/currencies/data/data_sources/currencies_remote_data_source.dart';
import 'package:currency_converter/features/currencies/data/mappers/currency_historical_data_api_response.dart';
import 'package:currency_converter/features/currencies/data/mappers/storable_currency.dart';
import 'package:currency_converter/features/currencies/data/models/currencies_api_response.dart';
import 'package:currency_converter/features/currencies/data/models/currency_historical_data_api_response.dart';
import 'package:currency_converter/features/currencies/data/models/historical_data_model.dart';
import 'package:currency_converter/features/currencies/data/models/latest_rate_api_response.dart';
import 'package:currency_converter/features/currencies/data/models/rate_model.dart';
import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';
import 'package:currency_converter/features/currencies/data/repositories/currencies_repository_impl.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/rate.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrenciesRemoteDataSource extends Mock
    implements CurrenciesRemoteDataSource {}

class MockCurrenciesLocalDataSource extends Mock
    implements CurrenciesLocalDataSource {}

class FakeAppEnvVariables extends Fake implements AppEnvVariables {
  @override
  String get flagsBaseUrl => "";
}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  S.load(const Locale("en"));
  getIt.registerSingleton<AppEnvVariables>(FakeAppEnvVariables());
  late CurrenciesRemoteDataSource remoteDataSource;
  late CurrenciesLocalDataSource localDataSource;
  setUp(() {
    remoteDataSource = MockCurrenciesRemoteDataSource();
    localDataSource = MockCurrenciesLocalDataSource();
  });

  tearDown(() {
    resetMocktailState();
  });

  group("getCurrencies", () {
    test(
        "test when the currencies exists locally returns them and doesn't call the remote",
        () async {
      final storableCurrencies = [StorableCurrency("USD", "\$", "Dollar")];
      when(() => localDataSource.getCurrencies())
          .thenAnswer((invocation) async => storableCurrencies);
      final repo = CurrenciesRepositoryImpl(remoteDataSource, localDataSource);

      final data = await repo.getCurrencies();
      verify(() => localDataSource.getCurrencies()).called(1);
      verifyNever(() => remoteDataSource.getCurrencies());
      expect(data.isRight(), true);
      expect(data.getOrElse(() => []),
          storableCurrencies.map((e) => e.domain).toList());
    });

    test(
        "test when the currencies don't exist locally calls remote, save them and return them",
        () async {
      final currencies = [
        const Currency(code: "USD", symbol: "\$", name: "Dollar")
      ];
      when(() => localDataSource.getCurrencies())
          .thenAnswer((invocation) async => []);
      when(() => localDataSource.saveCurrencies(
          currencies: any(named: "currencies"))).thenAnswer((invocation) {});
      when(() => remoteDataSource.getCurrencies()).thenAnswer(
          (invocation) async => CurrenciesApiResponse(
              data: Data(
                  [CurrencyModel(code: "USD", symbol: "\$", name: "Dollar")])));
      final repo = CurrenciesRepositoryImpl(remoteDataSource, localDataSource);

      final data = await repo.getCurrencies();
      verify(() => localDataSource.getCurrencies()).called(1);
      verify(() =>
          localDataSource.saveCurrencies(currencies: any(named: "currencies")));
      verify(() => remoteDataSource.getCurrencies()).called(1);
      expect(data.isRight(), true);
      expect(data.getOrElse(() => []), currencies);
    });
  });
  group("getRate", () {
    test("test if the rate is available locally returns it", () async {
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      const secondCurrency = Currency(symbol: "\$", name: "Euro", code: "EUR");
      final rate = ExchangeRate("EUR", 1);
      when(() => localDataSource.getRate(
              base: currency.code, currency: secondCurrency.code))
          .thenAnswer((invocation) async => rate);
      final repo = CurrenciesRepositoryImpl(remoteDataSource, localDataSource);
      final data = await repo.getRate(base: currency, to: secondCurrency);
      verify(() => localDataSource.getRate(
          base: currency.code, currency: secondCurrency.code)).called(1);
      verifyNever(() => remoteDataSource.getRates(base: currency.code));
      expect(data.isRight(), true);
      expect(data.getOrElse(() => Rate.invalid()),
          const Rate(currentRate: 1.0, base: currency, to: secondCurrency));
    });

    test(
        "test if the rate is not available locally it calls the remote with the base to get all of conversions saves them  and returns the conversion of the to currency",
        () async {
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      const secondCurrency = Currency(symbol: "\$", name: "Euro", code: "EUR");
      final rates = [RateModel(code: "EUR", exchangeRate: 1)];
      final storableRate = ExchangeRate("EUR", 1.0);
      when(() => localDataSource.getRate(
              base: currency.code, currency: secondCurrency.code))
          .thenAnswer((invocation) async => null);
      when(() => remoteDataSource.getRates(base: currency.code))
          .thenAnswer((invocation) async {
        when(() => localDataSource.getRate(
                base: currency.code, currency: secondCurrency.code))
            .thenAnswer((invocation) async => storableRate);
        return LatestRateApiResponse(data: rates);
      });

      final repo = CurrenciesRepositoryImpl(remoteDataSource, localDataSource);
      final data = await repo.getRate(base: currency, to: secondCurrency);

      verify(() => remoteDataSource.getRates(base: currency.code)).called(1);
      verify(() => localDataSource.saveExchangeRates(
          code: currency.code, rates: any(named: "rates")));
      verify(() => localDataSource.getRate(
          base: currency.code, currency: secondCurrency.code)).called(2);
      expect(data.isRight(), true);
      expect(data.getOrElse(() => Rate.invalid()),
          const Rate(currentRate: 1.0, base: currency, to: secondCurrency));
    });
  });

  group("getWeekBackHistoricalData", () {
    test(
        "test calls the remote data source with the right arguments and returns a right",
        () async {
      withClock(Clock.fixed(DateTime(2022, 4, 22)), () async {
        final dateTo = DateTime(2022, 4, 22);
        final dateFrom = DateTime(2022, 4, 15);
        const baseCurrency = "USD";
        const currency = "EUR";

        final history = List.generate(
            7,
            (index) => HistoricalDataModel(
                date: DateTime(2022, 4, 15 + index), rate: index + 1));
        when(() => remoteDataSource.getHistoricalData(
                baseCurrency: baseCurrency,
                currency: currency,
                dateFrom: any(named: "dateFrom"),
                dateTo: any(named: "dateTo")))
            .thenAnswer((invocation) async =>
                CurrencyHistoricalDataApiResponse(data: history));

        final repo =
            CurrenciesRepositoryImpl(remoteDataSource, localDataSource);
        final data = await repo.getWeekBackHistoricalData(
            userBaseCurrency: baseCurrency, currency: currency);
        verify(() => remoteDataSource.getHistoricalData(
            baseCurrency: baseCurrency,
            currency: currency,
            dateFrom: dateFrom,
            dateTo: dateTo));
        expect(data.isRight(), true);
        expect(data.getOrElse(() => []),
            CurrencyHistoricalDataApiResponse(data: history).domain);
      });
    });
  });
}
