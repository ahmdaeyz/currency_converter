import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHistoricalDataBaseCurrencyUseCase
    extends UseCase<Future<String>, NoParams> {
  final SettingsRepository _repository;

  GetHistoricalDataBaseCurrencyUseCase(this._repository);

  @override
  Future<String> call(NoParams params) =>
      _repository.getHistoricalDataBaseCurrency();
}
