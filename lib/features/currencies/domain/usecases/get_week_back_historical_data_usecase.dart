import 'package:currency_converter/core/domain/entities/failures/failures.dart';
import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency_historical_data.dart';
import 'package:currency_converter/features/currencies/domain/repositories/currencies_repository.dart';
import 'package:currency_converter/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWeekBackHistoricalDataUseCase extends UseCase<
    Future<Either<Failure, List<CurrencyHistoricalData>>>, String> {
  final CurrenciesRepository _repository;
  final SettingsRepository _settingsRepository;

  GetWeekBackHistoricalDataUseCase(this._repository, this._settingsRepository);

  @override
  Future<Either<Failure, List<CurrencyHistoricalData>>> call(
      String params) async {
    final userBaseCurrency =
        await _settingsRepository.getHistoricalDataBaseCurrency();
    return _repository.getWeekBackHistoricalData(
        userBaseCurrency: userBaseCurrency, currency: params);
  }
}
