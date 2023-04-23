import 'package:currency_converter/features/currencies/domain/entities/currency_historical_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_historical_data_state.freezed.dart';

@freezed
abstract class CurrencyHistoricalDataState with _$CurrencyHistoricalDataState {
  const factory CurrencyHistoricalDataState.initial() = Initial;

  const factory CurrencyHistoricalDataState.loading() = Loading;

  const factory CurrencyHistoricalDataState.loaded(
      {required List<CurrencyHistoricalData> rates}) = Loaded;

  const factory CurrencyHistoricalDataState.error({required String message}) =
      Error;
}
