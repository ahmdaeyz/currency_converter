import 'package:clock/clock.dart';
import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/data/utils/repository.dart';
import 'package:currency_converter/core/domain/entities/failures/failure.dart';
import 'package:currency_converter/features/currencies/data/data_sources/currencies_local_data_source.dart';
import 'package:currency_converter/features/currencies/data/data_sources/currencies_remote_data_source.dart';
import 'package:currency_converter/features/currencies/data/mappers/currencies_api_response.dart';
import 'package:currency_converter/features/currencies/data/mappers/currency.dart';
import 'package:currency_converter/features/currencies/data/mappers/currency_historical_data_api_response.dart';
import 'package:currency_converter/features/currencies/data/mappers/exchange_rate.dart';
import 'package:currency_converter/features/currencies/data/mappers/rate_model.dart';
import 'package:currency_converter/features/currencies/data/mappers/storable_currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency_historical_data.dart';
import 'package:currency_converter/features/currencies/domain/entities/rate.dart';
import 'package:currency_converter/features/currencies/domain/repositories/currencies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: CurrenciesRepository)
class CurrenciesRepositoryImpl implements CurrenciesRepository {
  final CurrenciesRemoteDataSource _remoteDataSource;
  final CurrenciesLocalDataSource _localDataSource;

  CurrenciesRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, List<Currency>>> getCurrencies() async =>
      await conclude(() async {
        final currenciesLocally = await _localDataSource.getCurrencies();
        if (currenciesLocally.isNotEmpty) {
          final domainCurrencies = currenciesLocally.map((e) => e.domain);
          return domainCurrencies.toList();
        } else {
          return await _syncCurrenciesWithRemote(
              shouldSave: currenciesLocally.isEmpty);
        }
      });

  /// Gets the rate for a code against another code
  ///
  /// Stores all the exchange rates of the code in storage for faster future retrievals
  @override
  Future<Either<Failure, Rate>> getRate(
          {required Currency base, required Currency to}) =>
      conclude(() async {
        final rateLocally =
            await _localDataSource.getRate(base: base.code, currency: to.code);
        if (rateLocally != null) {
          return rateLocally.domain.copyWith(base: base, to: to);
        } else {
          await _syncRatesWithRemote(base.code);
          final rateLocally = await _localDataSource.getRate(
              base: base.code, currency: to.code);
          if (rateLocally != null) {
            return rateLocally.domain.copyWith(base: base, to: to);
          }
        }
        return Rate.invalid();
      });

  @override
  Future<Either<Failure, List<CurrencyHistoricalData>>>
      getWeekBackHistoricalData({
    required String userBaseCurrency,
    required String currency,
  }) async =>
          await conclude(() async {
            final currentDate = clock.now();
            final weekAgoDate = currentDate.subtract(const Duration(days: 7));
            final response = await _remoteDataSource.getHistoricalData(
                baseCurrency: userBaseCurrency,
                currency: currency,
                dateFrom: weekAgoDate,
                dateTo: currentDate);
            final inDomain = response.domain;
            return inDomain;
          });

  Future<List<Currency>> _syncCurrenciesWithRemote(
      {required bool shouldSave}) async {
    final response = await _remoteDataSource.getCurrencies();
    final dataInDomain = response.domain;
    final dataAsStorable = dataInDomain.map((e) => e.storable).toList();
    if (shouldSave) {
      /// Not being able to save the currencies shouldn't halt returning them.
      try {
        _localDataSource.saveCurrencies(currencies: dataAsStorable);
      } catch (e) {
        getIt<Logger>().log(Level.warning, e.toString());
      }
    }
    return dataInDomain;
  }

  Future<void> _syncRatesWithRemote(String code,
      {bool shouldSave = true}) async {
    final response = await _remoteDataSource.getRates(
      base: code,
    );
    final rateModels = response.data;
    final storableRates = rateModels.map((e) => e.storable).toList();
    if (shouldSave) {
      _localDataSource.saveExchangeRates(code: code, rates: storableRates);
    }
  }
}
