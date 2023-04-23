import 'package:currency_converter/core/domain/entities/failures/failures.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/get_rate_params.dart';
import 'package:currency_converter/features/currencies/domain/entities/rate.dart';
import 'package:currency_converter/features/currencies/domain/usecases/get_rate_usecase.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_state.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetRateUseCase extends Mock implements GetRateUseCase {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  S.load(const Locale("en"));
  late GetRateUseCase getRateUseCase;

  setUp(() {
    getRateUseCase = MockGetRateUseCase();
  });

  tearDown(() {
    resetMocktailState();
  });

  group("selectBaseCurrency", () {
    test("test the class is in the right state and the right state is emitted",
        () {
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      final cubit = CurrencyConverterCubit(getRateUseCase);
      expectLater(
          cubit.stream,
          emitsInOrder([
            const CurrencyConverterState.currencySelected(
                currency: currency, type: CurrencySelectionType.base)
          ]));
      cubit.selectBaseCurrency(currency: currency);
      expect(cubit.base, currency);
      expect(cubit.to, null);
    });

    test("test can select the same currency as to", () {
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      final cubit = CurrencyConverterCubit(getRateUseCase);
      expectLater(
          cubit.stream,
          emitsInOrder([
            const CurrencyConverterState.currencySelected(
                currency: currency, type: CurrencySelectionType.to),
            const CurrencyConverterState.currencySelected(
                currency: currency, type: CurrencySelectionType.base),
          ]));
      cubit.selectToCurrency(currency: currency);
      cubit.selectBaseCurrency(currency: currency);
      expect(cubit.base, currency);
      expect(cubit.to, currency);
    });
  });

  group("selectToCurrency", () {
    test("test the class is in the right state and the right state is emitted",
        () {
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      final cubit = CurrencyConverterCubit(getRateUseCase);
      expectLater(
          cubit.stream,
          emitsInOrder([
            const CurrencyConverterState.currencySelected(
                currency: currency, type: CurrencySelectionType.to)
          ]));
      cubit.selectToCurrency(currency: currency);
      expect(cubit.to, currency);
      expect(cubit.base, null);
    });
    test("test can select the same currency as base", () {
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      final cubit = CurrencyConverterCubit(getRateUseCase);
      expectLater(
          cubit.stream,
          emitsInOrder([
            const CurrencyConverterState.currencySelected(
                currency: currency, type: CurrencySelectionType.base),
            const CurrencyConverterState.currencySelected(
                currency: currency, type: CurrencySelectionType.to)
          ]));
      cubit.selectBaseCurrency(currency: currency);
      cubit.selectToCurrency(currency: currency);
      expect(cubit.base, currency);
      expect(cubit.to, currency);
    });
  });

  group("validate", () {
    test(
        "test if base and to are not selected return false and emits errorInSelection with a both type",
        () {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      expectLater(
          cubit.stream,
          emitsInOrder([
            CurrencyConverterState.errorInSelection(
                message: S.current.nothingSelected,
                type: ErrorInSelectionType.both)
          ]));
      const dummyAmount = "4.5";
      final isValid = cubit.validate(dummyAmount);
      expect(isValid, false);
    });

    test(
        "test if base is not selected return false and emits errorInSelection with a base type",
        () {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      cubit.selectToCurrency(currency: currency);
      expectLater(
          cubit.stream,
          emitsInOrder([
            CurrencyConverterState.errorInSelection(
                message: S.current.noBaseSelected,
                type: ErrorInSelectionType.base)
          ]));
      const dummyAmount = "4.5";
      final isValid = cubit.validate(dummyAmount);
      expect(isValid, false);
    });
    test(
        "test if to is not selected return false and emits errorInSelection with a to type",
        () {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      cubit.selectBaseCurrency(currency: currency);
      expectLater(
          cubit.stream,
          emitsInOrder([
            CurrencyConverterState.errorInSelection(
                message: S.current.noToSelected, type: ErrorInSelectionType.to)
          ]));
      const dummyAmount = "4.5";
      final isValid = cubit.validate(dummyAmount);
      expect(isValid, false);
    });

    test(
        "test if are equal return false and emits errorInSelection with a both type",
        () {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      cubit.selectBaseCurrency(currency: currency);
      cubit.selectToCurrency(currency: currency);
      expectLater(
          cubit.stream,
          emitsInOrder([
            CurrencyConverterState.errorInSelection(
                message: S.current.invalidEqualSelection,
                type: ErrorInSelectionType.both)
          ]));
      const dummyAmount = "4.5";
      final isValid = cubit.validate(dummyAmount);
      expect(isValid, false);
    });
    test("test if amount is invalid returns false and emits errorInConversion",
        () {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      const secondCurrency = Currency(symbol: "\$", name: "Euro", code: "EUR");
      cubit.selectBaseCurrency(currency: currency);
      cubit.selectToCurrency(currency: secondCurrency);
      expectLater(
          cubit.stream,
          emitsInOrder([
            CurrencyConverterState.errorInConversion(
              message: S.current.invalidAmount,
            )
          ]));
      const amount = "fgfg";
      final isValid = cubit.validate(amount);
      expect(isValid, false);
    });

    test("test if all is valid returns true", () {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      const secondCurrency = Currency(symbol: "\$", name: "Euro", code: "EUR");
      cubit.selectBaseCurrency(currency: currency);
      cubit.selectToCurrency(currency: secondCurrency);
      const amount = "3.4";
      final isValid = cubit.validate(amount);
      expect(isValid, true);
    });
  });

  group("convert", () {
    test("test if called and the state is invalid throws assertion error", () {
      final cubit = CurrencyConverterCubit(getRateUseCase);

      expect(() => cubit.convert(amount: "3.4"), throwsAssertionError);
    });

    test(
        "test when valid and the use case returns data computes the conversion and emits the right state",
        () async {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      const secondCurrency = Currency(symbol: "\$", name: "Euro", code: "EUR");
      cubit.selectBaseCurrency(currency: currency);
      cubit.selectToCurrency(currency: secondCurrency);
      const amount = "3.4";
      const rate = Rate(currentRate: 1, base: currency, to: secondCurrency);
      when(() => getRateUseCase
              .call(const GetRateParams(base: currency, to: secondCurrency)))
          .thenAnswer((invocation) async => const Right(rate));
      expectLater(
          cubit.stream,
          emitsInOrder(
              [const CurrencyConverterState.converted(conversion: "3.40")]));
      await cubit.convert(amount: amount);
      verify(() => getRateUseCase.call(
          const GetRateParams(base: currency, to: secondCurrency))).called(1);
    });

    test(
        "test when valid and the use case returns data but with the rate is less than 0 emits error",
        () async {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      const secondCurrency = Currency(symbol: "\$", name: "Euro", code: "EUR");
      cubit.selectBaseCurrency(currency: currency);
      cubit.selectToCurrency(currency: secondCurrency);
      const amount = "3.4";
      const rate = Rate(currentRate: -1, base: currency, to: secondCurrency);
      when(() => getRateUseCase
              .call(const GetRateParams(base: currency, to: secondCurrency)))
          .thenAnswer((invocation) async => const Right(rate));
      expectLater(
          cubit.stream,
          emitsInOrder([
            CurrencyConverterState.errorInConversion(
                message: S.current.somethingIsWrong)
          ]));
      await cubit.convert(amount: amount);
      verify(() => getRateUseCase.call(
          const GetRateParams(base: currency, to: secondCurrency))).called(1);
    });

    test("test when valid and the use case returns failure emits error",
        () async {
      final cubit = CurrencyConverterCubit(getRateUseCase);
      const currency = Currency(symbol: "\$", name: "Dollar", code: "USD");
      const secondCurrency = Currency(symbol: "\$", name: "Euro", code: "EUR");
      cubit.selectBaseCurrency(currency: currency);
      cubit.selectToCurrency(currency: secondCurrency);
      const amount = "3.4";
      const failureMessage = "Something is wrong";
      const failure = UnknowServerFailure(message: failureMessage);
      when(() => getRateUseCase
              .call(const GetRateParams(base: currency, to: secondCurrency)))
          .thenAnswer((invocation) async => const Left(failure));
      expectLater(
          cubit.stream,
          emitsInOrder([
            const CurrencyConverterState.errorInConversion(
                message: failureMessage)
          ]));
      await cubit.convert(amount: amount);
      verify(() => getRateUseCase.call(
          const GetRateParams(base: currency, to: secondCurrency))).called(1);
    });
  });
}
