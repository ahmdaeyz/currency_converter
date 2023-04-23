// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_converter/core/application/di/app_module.dart' as _i28;
import 'package:currency_converter/core/application/locale/locale_cubit.dart'
    as _i13;
import 'package:currency_converter/core/data/data_sources/cache_data_source.dart'
    as _i8;
import 'package:currency_converter/core/data/data_sources/env_variables.dart'
    as _i3;
import 'package:currency_converter/core/data/data_sources/secure_cache_data_source.dart'
    as _i9;
import 'package:currency_converter/features/currencies/data/data_sources/currencies_local_data_source.dart'
    as _i16;
import 'package:currency_converter/features/currencies/data/data_sources/currencies_remote_data_source.dart'
    as _i10;
import 'package:currency_converter/features/currencies/data/repositories/currencies_repository_impl.dart'
    as _i18;
import 'package:currency_converter/features/currencies/data/services/currency_storage_service.dart'
    as _i11;
import 'package:currency_converter/features/currencies/data/services/free_currency_api_service.dart'
    as _i6;
import 'package:currency_converter/features/currencies/data/services/realm_currency_storage_service.dart'
    as _i12;
import 'package:currency_converter/features/currencies/domain/repositories/currencies_repository.dart'
    as _i17;
import 'package:currency_converter/features/currencies/domain/usecases/get_currencies_list_usecase.dart'
    as _i19;
import 'package:currency_converter/features/currencies/domain/usecases/get_rate_usecase.dart'
    as _i21;
import 'package:currency_converter/features/currencies/domain/usecases/get_week_back_historical_data_usecase.dart'
    as _i22;
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_cubit.dart'
    as _i25;
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_cubit.dart'
    as _i26;
import 'package:currency_converter/features/currencies/presentation/manager/historical_data/currency_historical_data_cubit.dart'
    as _i27;
import 'package:currency_converter/features/settings/data/repositories/settings_repository.dart'
    as _i15;
import 'package:currency_converter/features/settings/domain/repositories/settings_repository.dart'
    as _i14;
import 'package:currency_converter/features/settings/domain/usecases/get_historical_data_base_currency_use_case.dart'
    as _i20;
import 'package:currency_converter/features/settings/domain/usecases/save_historical_data_base_currency_use_case.dart'
    as _i23;
import 'package:currency_converter/features/settings/presentation/manager/settings_cubit.dart'
    as _i24;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.AppEnvVariables>(
        () => _i3.CurrencyConverterEnvVariables());
    gh.lazySingleton<_i4.Dio>(() => appModule.dio);
    gh.lazySingleton<_i5.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.factory<_i6.FreeCurrencyApiService>(
        () => _i6.FreeCurrencyApiService(gh<_i4.Dio>()));
    gh.lazySingleton<_i7.Logger>(() => appModule.logger);
    gh.lazySingleton<_i8.CacheDataSource>(() => _i9.SecureCacheDataSource(
        secureStorage: gh<_i5.FlutterSecureStorage>()));
    gh.lazySingleton<_i10.CurrenciesRemoteDataSource>(() =>
        _i10.CurrenciesRemoteDataSourceImpl(gh<_i6.FreeCurrencyApiService>()));
    gh.singleton<_i11.CurrencyStorageService>(
        _i12.RealmCurrencyStorageService(gh<_i8.CacheDataSource>()));
    gh.lazySingleton<_i13.LocaleCubit>(
        () => _i13.LocaleCubit(cache: gh<_i8.CacheDataSource>()));
    gh.lazySingleton<_i14.SettingsRepository>(() => _i15.SettingsRepositoryImpl(
          gh<_i8.CacheDataSource>(),
          gh<_i3.AppEnvVariables>(),
        ));
    gh.lazySingleton<_i16.CurrenciesLocalDataSource>(() =>
        _i16.CurrenciesLocalDataSourceImpl(gh<_i11.CurrencyStorageService>()));
    gh.lazySingleton<_i17.CurrenciesRepository>(
        () => _i18.CurrenciesRepositoryImpl(
              gh<_i10.CurrenciesRemoteDataSource>(),
              gh<_i16.CurrenciesLocalDataSource>(),
            ));
    gh.factory<_i19.GetCurrenciesListUseCase>(
        () => _i19.GetCurrenciesListUseCase(gh<_i17.CurrenciesRepository>()));
    gh.factory<_i20.GetHistoricalDataBaseCurrencyUseCase>(() =>
        _i20.GetHistoricalDataBaseCurrencyUseCase(
            gh<_i14.SettingsRepository>()));
    gh.factory<_i21.GetRateUseCase>(
        () => _i21.GetRateUseCase(gh<_i17.CurrenciesRepository>()));
    gh.factory<_i22.GetWeekBackHistoricalDataUseCase>(
        () => _i22.GetWeekBackHistoricalDataUseCase(
              gh<_i17.CurrenciesRepository>(),
              gh<_i14.SettingsRepository>(),
            ));
    gh.factory<_i23.SaveHistoricalDataBaseCurrencyUseCase>(() =>
        _i23.SaveHistoricalDataBaseCurrencyUseCase(
            gh<_i14.SettingsRepository>()));
    gh.singleton<_i24.SettingsCubit>(_i24.SettingsCubit(
      gh<_i20.GetHistoricalDataBaseCurrencyUseCase>(),
      gh<_i23.SaveHistoricalDataBaseCurrencyUseCase>(),
    ));
    gh.factory<_i25.CurrenciesListCubit>(
        () => _i25.CurrenciesListCubit(gh<_i19.GetCurrenciesListUseCase>()));
    gh.factory<_i26.CurrencyConverterCubit>(
        () => _i26.CurrencyConverterCubit(gh<_i21.GetRateUseCase>()));
    gh.factory<_i27.CurrencyHistoricalDataCubit>(() =>
        _i27.CurrencyHistoricalDataCubit(
            gh<_i22.GetWeekBackHistoricalDataUseCase>()));
    return this;
  }
}

class _$AppModule extends _i28.AppModule {}
