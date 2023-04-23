import 'package:bloc/bloc.dart';
import 'package:currency_converter/core/presentation/utils/cubit.dart';
import 'package:currency_converter/features/currencies/domain/usecases/get_week_back_historical_data_usecase.dart';
import 'package:currency_converter/features/currencies/presentation/manager/historical_data/currency_historical_data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurrencyHistoricalDataCubit extends Cubit<CurrencyHistoricalDataState> {
  CurrencyHistoricalDataCubit(this._getWeekBackHistoricalDataUseCase)
      : super(const CurrencyHistoricalDataState.initial());
  final GetWeekBackHistoricalDataUseCase _getWeekBackHistoricalDataUseCase;

  Future<void> getWeekBackHistoricalData({required String currency}) async {
    emit(const CurrencyHistoricalDataState.loading());
    final edge = await _getWeekBackHistoricalDataUseCase(currency);
    emit(edge.fold(
        (failure) => errorStateFrom(failure, determineError: (_, message, __) {
              return CurrencyHistoricalDataState.error(message: message);
            }),
        (history) => CurrencyHistoricalDataState.loaded(rates: history)));
  }

  bool canDisplayHistoricalData(
      {required String? currentBaseCurrency, required String currencyCode}) {
    return currentBaseCurrency != null && currentBaseCurrency != currencyCode;
  }
}
