import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String symbol;
  final String name;
  final String code;
  final String? flagInSvg;

  const Currency(
      {required this.symbol,
      required this.name,
      required this.code,
      this.flagInSvg});

  @override
  List<Object?> get props => [code];

  Currency copyWith(
      {String? symbol, String? name, String? code, String? flagInSvg}) {
    return Currency(
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        code: code ?? this.code,
        flagInSvg: flagInSvg ?? this.flagInSvg);
  }
}
