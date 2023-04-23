import 'package:currency_converter/features/currencies/data/models/currency_historical_data_api_response.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency_historical_data.dart';

extension XCurrencyHistoricalDataApiResponse
    on CurrencyHistoricalDataApiResponse {
  List<CurrencyHistoricalData> get domain {
    return data
            ?.map((e) => CurrencyHistoricalData(date: e.date, rate: e.rate))
            .toList() ??
        [];
  }
}
