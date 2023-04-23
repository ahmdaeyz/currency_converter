import 'package:bloc/bloc.dart';
import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/features/settings/domain/usecases/get_historical_data_base_currency_use_case.dart';
import 'package:currency_converter/features/settings/domain/usecases/save_historical_data_base_currency_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

@Singleton()
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._getHistoricalDataBaseCurrencyUseCase,
      this._saveHistoricalDataBaseCurrencyUseCase)
      : super(SettingsInitial()) {
    getHistoricalDataBaseCurrency();
  }

  final GetHistoricalDataBaseCurrencyUseCase
      _getHistoricalDataBaseCurrencyUseCase;
  final SaveHistoricalDataBaseCurrencyUseCase
      _saveHistoricalDataBaseCurrencyUseCase;

  String? _historicalDataBaseCurrency;

  String? get historicalDataBaseCurrency => _historicalDataBaseCurrency;

  getHistoricalDataBaseCurrency() async {
    final base = await _getHistoricalDataBaseCurrencyUseCase(NoParams());
    _historicalDataBaseCurrency = base;
  }

  saveHistoricalDataBaseCurrency({required String baseCurrency}) {
    _historicalDataBaseCurrency = baseCurrency;
    _saveHistoricalDataBaseCurrencyUseCase(baseCurrency);
    emit(SettingsChanged());
  }
}
