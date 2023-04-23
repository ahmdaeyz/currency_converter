import 'package:currency_converter/core/domain/entities/failures/failures.dart';
import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/features/currencies/domain/entities/get_rate_params.dart';
import 'package:currency_converter/features/currencies/domain/entities/rate.dart';
import 'package:currency_converter/features/currencies/domain/repositories/currencies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRateUseCase
    extends UseCase<Future<Either<Failure, Rate>>, GetRateParams> {
  final CurrenciesRepository _repository;

  GetRateUseCase(this._repository);

  @override
  Future<Either<Failure, Rate>> call(GetRateParams params) =>
      _repository.getRate(base: params.base, to: params.to);
}
