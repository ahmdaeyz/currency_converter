/// data : {"BGN":{"symbol":"BGN","name":"Bulgarian Lev","symbol_native":"лв.","decimal_digits":2,"rounding":0,"code":"BGN","name_plural":"Bulgarian leva"},"CAD":{"symbol":"CA$","name":"Canadian Dollar","symbol_native":"$","decimal_digits":2,"rounding":0,"code":"CAD","name_plural":"Canadian dollars"}}

class CurrenciesApiResponse {
  CurrenciesApiResponse({
    this.data,
  });

  CurrenciesApiResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? data;

  CurrenciesApiResponse copyWith({
    Data? data,
  }) =>
      CurrenciesApiResponse(
        data: data ?? this.data,
      );
}

/// BGN : {"symbol":"BGN","name":"Bulgarian Lev","symbol_native":"лв.","decimal_digits":2,"rounding":0,"code":"BGN","name_plural":"Bulgarian leva"}
/// CAD : {"symbol":"CA$","name":"Canadian Dollar","symbol_native":"$","decimal_digits":2,"rounding":0,"code":"CAD","name_plural":"Canadian dollars"}

class Data {
  Data(this.currencies);

  List<CurrencyModel> currencies;

  factory Data.fromJson(dynamic json) {
    final map = json as Map<String, dynamic>;
    final list = <CurrencyModel>[];
    for (final item in map.values) {
      list.add(CurrencyModel.fromJson(item));
    }
    return Data(list);
  }

  Data copyWith({
    List<CurrencyModel>? list,
  }) =>
      Data(list ?? currencies.map((e) => e.copyWith()).toList());
}

/// symbol : "BGN"
/// name : "Bulgarian Lev"
/// symbol_native : "лв."
/// decimal_digits : 2
/// rounding : 0
/// code : "BGN"
/// name_plural : "Bulgarian leva"

class CurrencyModel {
  CurrencyModel({
    this.symbol,
    this.name,
    this.symbolNative,
    this.decimalDigits,
    this.rounding,
    this.code,
    this.namePlural,
  });

  CurrencyModel.fromJson(dynamic json) {
    symbol = json['symbol'];
    name = json['name'];
    symbolNative = json['symbol_native'];
    decimalDigits = json['decimal_digits'];
    rounding = json['rounding'];
    code = json['code'];
    namePlural = json['name_plural'];
  }

  String? symbol;
  String? name;
  String? symbolNative;
  int? decimalDigits;
  int? rounding;
  String? code;
  String? namePlural;

  CurrencyModel copyWith({
    String? symbol,
    String? name,
    String? symbolNative,
    int? decimalDigits,
    int? rounding,
    String? code,
    String? namePlural,
  }) =>
      CurrencyModel(
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        symbolNative: symbolNative ?? this.symbolNative,
        decimalDigits: decimalDigits ?? this.decimalDigits,
        rounding: rounding ?? this.rounding,
        code: code ?? this.code,
        namePlural: namePlural ?? this.namePlural,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['symbol'] = symbol;
    map['name'] = name;
    map['symbol_native'] = symbolNative;
    map['decimal_digits'] = decimalDigits;
    map['rounding'] = rounding;
    map['code'] = code;
    map['name_plural'] = namePlural;
    return map;
  }
}
