import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/features/settings/domain/usecases/get_historical_data_base_currency_use_case.dart';
import 'package:currency_converter/features/settings/domain/usecases/save_historical_data_base_currency_use_case.dart';
import 'package:currency_converter/features/settings/presentation/manager/settings_cubit.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetHistoricalDataBaseCurrencyUseCase extends Mock
    implements GetHistoricalDataBaseCurrencyUseCase {}

class MockSaveHistoricalDataBaseCurrencyUseCase extends Mock
    implements SaveHistoricalDataBaseCurrencyUseCase {}

void main() {
  var getHistoryUseCase = MockGetHistoricalDataBaseCurrencyUseCase();
  var saveHistoryUseCase = MockSaveHistoricalDataBaseCurrencyUseCase();
  setUp(() {
    getHistoryUseCase = MockGetHistoricalDataBaseCurrencyUseCase();
    saveHistoryUseCase = MockSaveHistoricalDataBaseCurrencyUseCase();
    registerFallbackValue(NoParams());
  });

  tearDown(() {
    resetMocktailState();
  });

  test("test gets the base currency on creation", () {
    const baseCurrency = "USD";
    when(() => getHistoryUseCase.call(any()))
        .thenAnswer((invocation) async => baseCurrency);
    SettingsCubit(getHistoryUseCase, saveHistoryUseCase);
    verify(() => getHistoryUseCase.call(any())).called(1);
  });

  test(
      "test getHistoricalDataBaseCurrency calls the use case and puts the class in the right state",
      () {
    fakeAsync((async) {
      const baseCurrency = "USD";
      when(() => getHistoryUseCase.call(any()))
          .thenAnswer((invocation) async => baseCurrency);
      final cubit = SettingsCubit(getHistoryUseCase, saveHistoryUseCase);
      cubit.getHistoricalDataBaseCurrency();
      verify(() => getHistoryUseCase.call(any())).called(2);
      async.flushTimers();
      expect(cubit.historicalDataBaseCurrency, baseCurrency);
    });
  });

  test(
      "test saveHistoricalDataBaseCurrency calls the use case with the provided data and puts the class in the right state",
      () {
    fakeAsync((async) {
      const baseCurrency = "USD";
      when(() => getHistoryUseCase.call(any()))
          .thenAnswer((invocation) async => baseCurrency);
      when(() => saveHistoryUseCase.call(any())).thenAnswer((invocation) {});
      final cubit = SettingsCubit(getHistoryUseCase, saveHistoryUseCase);
      async.flushTimers();
      expect(cubit.historicalDataBaseCurrency, baseCurrency);
      const newBase = "EUR";
      expectLater(
          cubit.stream, emitsInOrder(<SettingsState>[SettingsChanged()]));
      cubit.saveHistoricalDataBaseCurrency(baseCurrency: newBase);
      async.flushTimers();
      verify(() => saveHistoryUseCase.call(newBase)).called(1);
      expect(cubit.historicalDataBaseCurrency, newBase);
    });
  });
}
