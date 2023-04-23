import 'package:equatable/equatable.dart';

class CurrencyHistoricalData extends Equatable {
  final DateTime date;
  final num rate;

  const CurrencyHistoricalData({required this.date, required this.rate});

  @override
  List<Object?> get props => [date, rate];
}
