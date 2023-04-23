import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'currencies_list_state.freezed.dart';

@freezed
class CurrenciesListState with _$CurrenciesListState {
  const factory CurrenciesListState.initial() = Initial;

  const factory CurrenciesListState.loading() = Loading;

  const factory CurrenciesListState.loaded(
      {required List<Currency> currencies}) = Loaded;

  const factory CurrenciesListState.error({required String message}) = Error;
}
