import 'package:currency_converter/core/application/constants/cache_keys.dart';
import 'package:currency_converter/core/data/data_sources/cache_data_source.dart';
import 'package:currency_converter/core/data/data_sources/env_variables.dart';
import 'package:currency_converter/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final CacheDataSource _cacheDataSource;
  final AppEnvVariables _appEnvVariables;

  SettingsRepositoryImpl(this._cacheDataSource, this._appEnvVariables);

  @override
  Future<String> getHistoricalDataBaseCurrency() async {
    return await _cacheDataSource.getString(
            key: CacheKeys.historicalDataBaseCurrency) ??
        _appEnvVariables.defaultHistoricalDataBaseCurrency;
  }

  @override
  void saveHistoricalDataBaseCurrency({required String baseCurrency}) {
    _cacheDataSource.putString(
        key: CacheKeys.historicalDataBaseCurrency, value: baseCurrency);
  }
}
