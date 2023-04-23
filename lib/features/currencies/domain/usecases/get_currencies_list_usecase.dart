import 'package:currency_converter/core/domain/entities/failures/failures.dart';
import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/domain/repositories/currencies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrenciesListUseCase
    extends UseCase<Future<Either<Failure, List<Currency>>>, NoParams> {
  final CurrenciesRepository _repository;

  GetCurrenciesListUseCase(this._repository);

  @override
  Future<Either<Failure, List<Currency>>> call(NoParams params) =>
      _repository.getCurrencies();
}
