import 'package:currency_converter/core/application/constants/env_keys.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppEnvVariables)
class CurrencyConverterEnvVariables implements AppEnvVariables {
  @override
  String get apiKey {
    const apiKey = String.fromEnvironment(EnvKeys.apiKey);
    return apiKey;
  }

  @override
  String get baseUrl => "https://api.freecurrencyapi.com/v1/";

  @override
  String get flagsBaseUrl => "https://flagcdn.com/";

  @override
  String get defaultHistoricalDataBaseCurrency => "USD";
}

abstract class AppEnvVariables {
  String get apiKey;

  String get baseUrl;

  String get flagsBaseUrl;

  String get defaultHistoricalDataBaseCurrency;
}
