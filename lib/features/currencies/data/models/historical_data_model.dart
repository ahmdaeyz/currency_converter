import 'package:equatable/equatable.dart';

class HistoricalDataModel extends Equatable {
  final DateTime date;
  final num rate;

  const HistoricalDataModel({required this.date, required this.rate});

  @override
  List<Object?> get props => [date, rate];
}
