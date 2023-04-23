import 'package:currency_converter/features/currencies/data/models/rate_model.dart';

/// data : {"CAD":0.268551}

class LatestRateApiResponse {
  LatestRateApiResponse({
    required this.data,
  });

  factory LatestRateApiResponse.fromJson(dynamic json) {
    final data = json['data'] as Map;
    final List<RateModel> list = [];
    for (final item in data.entries) {
      list.add(RateModel(code: item.key, exchangeRate: item.value));
    }
    return LatestRateApiResponse(data: list);
  }

  List<RateModel> data;

  LatestRateApiResponse copyWith({
    List<RateModel>? data,
  }) =>
      LatestRateApiResponse(
        data: data ?? this.data.map((e) => e.copyWith()).toList(),
      );
}
