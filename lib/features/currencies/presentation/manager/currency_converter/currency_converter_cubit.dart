import 'package:bloc/bloc.dart';
import 'package:currency_converter/core/presentation/utils/cubit.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/get_rate_params.dart';
import 'package:currency_converter/features/currencies/domain/usecases/get_rate_usecase.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_state.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurrencyConverterCubit extends Cubit<CurrencyConverterState> {
  CurrencyConverterCubit(this._getRateUseCase)
      : super(const CurrencyConverterState.initial());
  final GetRateUseCase _getRateUseCase;
  Currency? _base;

  Currency? _to;

  Currency? get base => _base?.copyWith();

  Currency? get to => _to?.copyWith();

  void selectBaseCurrency({required Currency currency}) {
    _base = currency.copyWith();
    emit(CurrencyConverterState.currencySelected(
        currency: currency, type: CurrencySelectionType.base));
  }

  void selectToCurrency({required Currency currency}) {
    _to = currency.copyWith();
    emit(CurrencyConverterState.currencySelected(
        currency: currency, type: CurrencySelectionType.to));
  }

  /// Make sure to call validate first
  Future<void> convert({required String amount}) async {
    final isCurrentStateValid = validate(amount);
    assert(isCurrentStateValid,
        "Are you sure you have called the validate method?");
    final edgeRate =
        await _getRateUseCase(GetRateParams(base: _base!, to: _to!));
    emit(edgeRate.fold(
        (failure) =>
            errorStateFrom(failure, determineError: (type, message, isAction) {
              return CurrencyConverterState.errorInConversion(message: message);
            }), (rate) {
      if (rate.currentRate < 0) {
        return CurrencyConverterState.errorInConversion(
            message: S.current.somethingIsWrong);
      } else {
        final amountAsNum = num.parse(amount);
        final conversion = amountAsNum * rate.currentRate;
        return CurrencyConverterState.converted(
            conversion: conversion.toStringAsFixed(2));
      }
    }));
  }

  bool validate(String amount) {
    final selectedCurrenciesAreValid = _validateSelectedCurrencies();
    if (!selectedCurrenciesAreValid) {
      return false;
    } else {
      return _validateAmount(amount);
    }
  }

  bool _validateSelectedCurrencies() {
    if (_base == null && _to == null) {
      emit(CurrencyConverterState.errorInSelection(
          message: S.current.nothingSelected, type: ErrorInSelectionType.both));
      return false;
    } else if (_base == null) {
      emit(CurrencyConverterState.errorInSelection(
          message: S.current.noBaseSelected, type: ErrorInSelectionType.base));
      return false;
    } else if (_to == null) {
      emit(CurrencyConverterState.errorInSelection(
          message: S.current.noToSelected, type: ErrorInSelectionType.to));
      return false;
    } else if (_to == _base) {
      emit(CurrencyConverterState.errorInSelection(
          message: S.current.invalidEqualSelection,
          type: ErrorInSelectionType.both));
      return false;
    }
    return true;
  }

  bool _validateAmount(String amount) {
    final amountAsNum = num.tryParse(amount);
    if (amountAsNum != null) {
      return true;
    } else {
      emit(CurrencyConverterState.errorInConversion(
          message: S.current.invalidAmount));
    }
    return false;
  }
}
