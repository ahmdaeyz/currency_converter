class RateModel {
  final String code;
  final num exchangeRate;

  RateModel({required this.code, required this.exchangeRate});

  RateModel copyWith({String? code, num? exchangeRate}) {
    return RateModel(
        code: code ?? this.code,
        exchangeRate: exchangeRate ?? this.exchangeRate);
  }
}
