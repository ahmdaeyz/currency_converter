import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:equatable/equatable.dart';

class Rate extends Equatable {
  final Currency? base;
  final Currency? to;
  final num currentRate;

  const Rate({this.base, this.to, required this.currentRate});

  @override
  List<Object?> get props => [base, to, currentRate];

  Rate copyWith({Currency? base, Currency? to, num? currentRate}) {
    return Rate(
        currentRate: currentRate ?? this.currentRate,
        base: base ?? this.base?.copyWith(),
        to: to ?? this.to?.copyWith());
  }

  factory Rate.invalid() {
    return const Rate(currentRate: -1);
  }
}
