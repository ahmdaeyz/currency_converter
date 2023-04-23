import 'package:currency_converter/core/data/utils/data_source.dart';
import 'package:currency_converter/features/currencies/data/models/currencies_api_response.dart';
import 'package:currency_converter/features/currencies/data/models/currency_historical_data_api_response.dart';
import 'package:currency_converter/features/currencies/data/models/latest_rate_api_response.dart';
import 'package:currency_converter/features/currencies/data/services/free_currency_api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@LazySingleton(as: CurrenciesRemoteDataSource)
class CurrenciesRemoteDataSourceImpl implements CurrenciesRemoteDataSource {
  final FreeCurrencyApiService _apiService;

  CurrenciesRemoteDataSourceImpl(this._apiService);

  @override
  Future<CurrenciesApiResponse> getCurrencies() =>
      resolveOrThrow(() async => await _apiService.getCurrencies());

  @override
  Future<LatestRateApiResponse> getRates({required String base}) async =>
      resolveOrThrow(() async => await _apiService.getRate(baseCurrency: base));

  @override
  Future<CurrencyHistoricalDataApiResponse> getHistoricalData(
          {required String baseCurrency,
          required String currency,
          required DateTime dateFrom,
          required DateTime dateTo}) =>
      resolveOrThrow(() async {
        final dateFormat = DateFormat("yyyy-MM-dd", "en");

        /// We have to subtract one day because the api doesn't permit same day historical data
        ///
        /// If today is 09/11 we can't send date_to as 09/11 it must be 09/10
        return await _apiService.getHistoricalData(
            baseCurrency: baseCurrency,
            currency: currency,
            dateFrom:
                dateFormat.format(dateFrom.subtract(const Duration(days: 1))),
            dateTo:
                dateFormat.format(dateTo.subtract(const Duration(days: 1))));
      });
}

abstract class CurrenciesRemoteDataSource {
  Future<CurrenciesApiResponse> getCurrencies();

  Future<LatestRateApiResponse> getRates({required String base});

  Future<CurrencyHistoricalDataApiResponse> getHistoricalData(
      {required String baseCurrency,
      required String currency,
      required DateTime dateFrom,
      required DateTime dateTo});
}
