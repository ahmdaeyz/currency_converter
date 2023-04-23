import 'package:currency_converter/core/application/constants/endpoints.dart';
import 'package:currency_converter/features/currencies/data/models/currencies_api_response.dart';
import 'package:currency_converter/features/currencies/data/models/currency_historical_data_api_response.dart';
import 'package:currency_converter/features/currencies/data/models/latest_rate_api_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'free_currency_api_service.g.dart';

@RestApi()
@injectable
abstract class FreeCurrencyApiService {
  @factoryMethod
  factory FreeCurrencyApiService(Dio dio) = _FreeCurrencyApiService;

  @GET(Endpoints.currencies)
  Future<CurrenciesApiResponse> getCurrencies();

  @GET(Endpoints.latest)
  Future<LatestRateApiResponse> getRate(
      {@Query("base_currency") required String baseCurrency});

  @GET(Endpoints.historical)
  Future<CurrencyHistoricalDataApiResponse> getHistoricalData(
      {@Query("base_currency") required String baseCurrency,
      @Query("currencies") required String currency,
      @Query("date_from") required String dateFrom,
      @Query("date_to") required String dateTo});
}
