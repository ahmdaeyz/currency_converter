import 'package:currency_converter/core/domain/entities/failures/failures.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency_historical_data.dart';
import 'package:currency_converter/features/currencies/domain/usecases/get_week_back_historical_data_usecase.dart';
import 'package:currency_converter/features/currencies/presentation/manager/historical_data/currency_historical_data_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/historical_data/currency_historical_data_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetWeekBackHistoricalDataUseCase extends Mock
    implements GetWeekBackHistoricalDataUseCase {}

main() {
  late GetWeekBackHistoricalDataUseCase getWeekBackHistoricalDataUseCase;

  setUp(() {
    getWeekBackHistoricalDataUseCase = MockGetWeekBackHistoricalDataUseCase();
  });

  tearDown(() {
    resetMocktailState();
  });

  group("getWeekBackHistoricalData", () {
    test(
        "test when the use case returns data the class gets in the right state and emits the right states",
        () async {
      const currency = "USD";
      final history = [
        CurrencyHistoricalData(rate: 3.3, date: DateTime(1999, 1, 2))
      ];
      when(() => getWeekBackHistoricalDataUseCase.call(currency))
          .thenAnswer((invocation) async => Right(history));
      final cubit =
          CurrencyHistoricalDataCubit(getWeekBackHistoricalDataUseCase);
      expectLater(
          cubit.stream,
          emitsInOrder([
            const CurrencyHistoricalDataState.loading(),
            CurrencyHistoricalDataState.loaded(rates: history)
          ]));
      await cubit.getWeekBackHistoricalData(currency: currency);
      verify(() => getWeekBackHistoricalDataUseCase.call(currency)).called(1);
    });

    test(
        "test when the use case returns failure the class gets in the right state and emits the right states",
        () async {
      const currency = "USD";
      const failureMessage = "Something is wrong";
      const failure = UnknowServerFailure(message: failureMessage);
      when(() => getWeekBackHistoricalDataUseCase.call(currency))
          .thenAnswer((invocation) async => const Left(failure));
      final cubit =
          CurrencyHistoricalDataCubit(getWeekBackHistoricalDataUseCase);
      expectLater(
          cubit.stream,
          emitsInOrder([
            const CurrencyHistoricalDataState.loading(),
            const CurrencyHistoricalDataState.error(message: failureMessage)
          ]));
      await cubit.getWeekBackHistoricalData(currency: currency);
      verify(() => getWeekBackHistoricalDataUseCase.call(currency)).called(1);
    });
  });

  group("canDisplayHistoricalData", () {
    test("test if base currency is null returns false", () {
      final cubit =
          CurrencyHistoricalDataCubit(getWeekBackHistoricalDataUseCase);
      final actual = cubit.canDisplayHistoricalData(
          currentBaseCurrency: null, currencyCode: "USD");
      expect(actual, false);
    });
    test("test if base currency and currency are identical returns false", () {
      final cubit =
          CurrencyHistoricalDataCubit(getWeekBackHistoricalDataUseCase);
      final actual = cubit.canDisplayHistoricalData(
          currentBaseCurrency: "USD", currencyCode: "USD");
      expect(actual, false);
    });

    test("test if base currency and currency are different returns true", () {
      final cubit =
          CurrencyHistoricalDataCubit(getWeekBackHistoricalDataUseCase);
      final actual = cubit.canDisplayHistoricalData(
          currentBaseCurrency: "EUR", currencyCode: "USD");
      expect(actual, true);
    });
  });
}
