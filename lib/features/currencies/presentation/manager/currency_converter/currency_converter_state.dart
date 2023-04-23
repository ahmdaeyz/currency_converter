import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_converter_state.freezed.dart';

@freezed
class CurrencyConverterState with _$CurrencyConverterState {
  const factory CurrencyConverterState.initial() = Initial;

  const factory CurrencyConverterState.currencySelected(
      {required Currency currency,
      required CurrencySelectionType type}) = CurrencySelected;

  const factory CurrencyConverterState.converted({required String conversion}) =
      Converted;

  const factory CurrencyConverterState.errorInConversion(
      {required String message}) = ErrorInConversion;

  const factory CurrencyConverterState.errorInCurrencies(
      {required String message}) = ErrorInCurrencies;

  const factory CurrencyConverterState.errorInSelection(
      {required String message,
      required ErrorInSelectionType type}) = ErrorInSelection;
}

enum CurrencySelectionType { base, to }

enum ErrorInSelectionType { base, to, both }
