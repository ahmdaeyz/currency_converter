import 'package:currency_converter/core/domain/entities/failures/failures.dart';
import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/domain/usecases/get_currencies_list_usecase.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCurrenciesListUseCase extends Mock
    implements GetCurrenciesListUseCase {}

main() {
  late GetCurrenciesListUseCase getCurrenciesListUseCase;

  setUp(() {
    getCurrenciesListUseCase = MockGetCurrenciesListUseCase();
    registerFallbackValue(NoParams());
  });

  tearDown(() {
    resetMocktailState();
  });

  test(
      "test when the use case returns data the class gets in the right state and emits the right states",
      () async {
    final currencies = [
      const Currency(symbol: "\$", name: "US Dollar", code: "USD")
    ];
    when(() => getCurrenciesListUseCase.call(NoParams()))
        .thenAnswer((invocation) async => Right(currencies));
    final cubit = CurrenciesListCubit(getCurrenciesListUseCase);
    expectLater(
        cubit.stream,
        emitsInOrder([
          const CurrenciesListState.loading(),
          CurrenciesListState.loaded(currencies: currencies)
        ]));
    await cubit.getCurrenciesList();
    verify(() => getCurrenciesListUseCase.call(NoParams())).called(1);
    expect(cubit.currencies, currencies);
  });

  test(
      "test the class is in the right state after refreshing (calling getCurrenciesList more than once) ",
      () async {
    final currencies = [
      const Currency(symbol: "\$", name: "US Dollar", code: "USD")
    ];
    when(() => getCurrenciesListUseCase.call(NoParams()))
        .thenAnswer((invocation) async => Right(currencies));
    final cubit = CurrenciesListCubit(getCurrenciesListUseCase);
    final newCurrencies = [
      const Currency(symbol: "\$", name: "US Dollar", code: "USD"),
      const Currency(symbol: "€", name: "Euro", code: "EUR")
    ];
    expectLater(
        cubit.stream,
        emitsInOrder([
          const CurrenciesListState.loading(),
          CurrenciesListState.loaded(currencies: currencies),
          const CurrenciesListState.loading(),
          CurrenciesListState.loaded(currencies: newCurrencies),
        ]));

    /// First time
    await cubit.getCurrenciesList();

    when(() => getCurrenciesListUseCase.call(NoParams()))
        .thenAnswer((invocation) async => Right(newCurrencies));

    /// Second time
    await cubit.getCurrenciesList();
    verify(() => getCurrenciesListUseCase.call(NoParams())).called(2);
    expect(cubit.currencies, newCurrencies);
  });

  test(
      "test when the use case returns failure the class gets in the right state and emits the right states",
      () async {
    const failureMessage = "Something is wrong";
    const failure = UnknowServerFailure(message: failureMessage);
    when(() => getCurrenciesListUseCase.call(NoParams()))
        .thenAnswer((invocation) async => const Left(failure));
    final cubit = CurrenciesListCubit(getCurrenciesListUseCase);
    expectLater(
        cubit.stream,
        emitsInOrder([
          const CurrenciesListState.loading(),
          const CurrenciesListState.error(message: failureMessage)
        ]));
    await cubit.getCurrenciesList();
    verify(() => getCurrenciesListUseCase.call(NoParams())).called(1);
    expect(cubit.currencies, []);
  });

  test(
      "test resumes normally after failure on refresh (recalling getCurrenciesList)",
      () async {
    const failureMessage = "Something is wrong";
    const failure = UnknowServerFailure(message: failureMessage);
    final newCurrencies = [
      const Currency(symbol: "\$", name: "US Dollar", code: "USD"),
      const Currency(symbol: "€", name: "Euro", code: "EUR")
    ];
    when(() => getCurrenciesListUseCase.call(NoParams()))
        .thenAnswer((invocation) async => const Left(failure));
    final cubit = CurrenciesListCubit(getCurrenciesListUseCase);
    expectLater(
        cubit.stream,
        emitsInOrder([
          const CurrenciesListState.loading(),
          const CurrenciesListState.error(message: failureMessage),
          const CurrenciesListState.loading(),
          CurrenciesListState.loaded(currencies: newCurrencies)
        ]));
    await cubit.getCurrenciesList();

    when(() => getCurrenciesListUseCase.call(NoParams()))
        .thenAnswer((invocation) async => Right(newCurrencies));

    /// refreshing
    await cubit.getCurrenciesList();

    verify(() => getCurrenciesListUseCase.call(NoParams())).called(2);
    expect(cubit.currencies, newCurrencies);
  });
}
