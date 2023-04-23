import 'package:currency_converter/core/application/constants/cache_keys.dart';
import 'package:currency_converter/core/data/data_sources/cache_data_source.dart';
import 'package:currency_converter/core/data/data_sources/env_variables.dart';
import 'package:currency_converter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCacheDataSource extends Mock implements CacheDataSource {}

class MockAppEnvVariables extends Mock implements AppEnvVariables {}

void main() {
  late CacheDataSource cacheDataSource;
  late AppEnvVariables appEnvVariables;

  setUp(() {
    cacheDataSource = MockCacheDataSource();
    appEnvVariables = MockAppEnvVariables();
  });

  tearDown(() {
    resetMocktailState();
  });

  test(
      "test getHistoricalDataBaseCurrency returns the right value when it exists in the cache",
      () async {
    const baseCurrency = "EUR";
    when(() => cacheDataSource.getString(
            key: CacheKeys.historicalDataBaseCurrency))
        .thenAnswer((invocation) async => baseCurrency);
    final settingsRepo =
        SettingsRepositoryImpl(cacheDataSource, appEnvVariables);
    final actual = await settingsRepo.getHistoricalDataBaseCurrency();
    verify(() => cacheDataSource.getString(
        key: CacheKeys.historicalDataBaseCurrency)).called(1);
    verifyNever(() => appEnvVariables.defaultHistoricalDataBaseCurrency);
    expect(actual, baseCurrency);
  });

  test(
      "test getHistoricalDataBaseCurrency returns the value from app env variables when nothing is in the cache",
      () async {
    const baseCurrency = "USD";
    when(() => cacheDataSource.getString(
            key: CacheKeys.historicalDataBaseCurrency))
        .thenAnswer((invocation) async => null);
    when(() => appEnvVariables.defaultHistoricalDataBaseCurrency)
        .thenReturn(baseCurrency);
    final settingsRepo =
        SettingsRepositoryImpl(cacheDataSource, appEnvVariables);
    final actual = await settingsRepo.getHistoricalDataBaseCurrency();
    verify(() => cacheDataSource.getString(
        key: CacheKeys.historicalDataBaseCurrency)).called(1);
    verify(() => appEnvVariables.defaultHistoricalDataBaseCurrency).called(1);
    expect(actual, baseCurrency);
  });

  test("test saveHistoricalDataBaseCurrency saves the value to the cache", () {
    const toBeSavedBase = "EUR";
    when(() => cacheDataSource.putString(
        key: CacheKeys.historicalDataBaseCurrency,
        value: toBeSavedBase)).thenAnswer((invocation) {});
    final settingsRepo =
        SettingsRepositoryImpl(cacheDataSource, appEnvVariables);
    settingsRepo.saveHistoricalDataBaseCurrency(baseCurrency: toBeSavedBase);
    verify(() => cacheDataSource.putString(
        key: CacheKeys.historicalDataBaseCurrency,
        value: toBeSavedBase)).called(1);
  });
}
