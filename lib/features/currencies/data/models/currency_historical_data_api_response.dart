import 'package:collection/collection.dart';
import 'package:currency_converter/features/currencies/data/models/historical_data_model.dart';

/// data : {"2023-04-12":{"EUR":0.511383},"2023-04-13":{"EUR":0.511255},"2023-04-14":{"EUR":0.50582},"2023-04-15":{"EUR":0.506335},"2023-04-16":{"EUR":0.511817},"2023-04-17":{"EUR":0.51456},"2023-04-18":{"EUR":0.511142},"2023-04-19":{"EUR":0.511882}}

class CurrencyHistoricalDataApiResponse {
  CurrencyHistoricalDataApiResponse({
    this.data,
  });

  factory CurrencyHistoricalDataApiResponse.fromJson(dynamic json) {
    final data = json['data'] as Map;
    final List<HistoricalDataModel> list = [];
    for (final item in data.entries) {
      final parsedDate = DateTime.tryParse(item.key ?? "");
      final rate = (item.value as Map).values.firstOrNull;
      if (parsedDate != null && rate != null) {
        list.add(HistoricalDataModel(date: parsedDate, rate: rate));
      }
    }
    return CurrencyHistoricalDataApiResponse(data: list);
  }

  List<HistoricalDataModel>? data;

  CurrencyHistoricalDataApiResponse copyWith({
    List<HistoricalDataModel>? data,
  }) =>
      CurrencyHistoricalDataApiResponse(
        data: data ?? this.data,
      );
}
