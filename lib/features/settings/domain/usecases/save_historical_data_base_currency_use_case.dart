import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveHistoricalDataBaseCurrencyUseCase extends UseCase<void, String> {
  final SettingsRepository _repository;

  SaveHistoricalDataBaseCurrencyUseCase(this._repository);

  @override
  void call(String params) {
    _repository.saveHistoricalDataBaseCurrency(baseCurrency: params);
  }
}
