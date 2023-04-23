import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:equatable/equatable.dart';

class GetRateParams extends Equatable {
  final Currency base;
  final Currency to;

  const GetRateParams({required this.base, required this.to});

  @override
  List<Object?> get props => [base, to];
}
