import 'package:collection/collection.dart';
import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/data/data_sources/env_variables.dart';
import 'package:currency_converter/features/currencies/data/models/currencies_api_response.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';

extension XCurrenciesApiResponse on CurrenciesApiResponse {
  List<Currency> get domain {
    return data?.currencies
            .map((e) => Currency(
                symbol: e.symbol ?? "", name: e.name ?? "", code: e.code ?? ""))
            .whereNot((element) =>
                element.name == "" ||
                element.symbol == "" ||
                element.code == "")
            .map((e) => e.copyWith(
                flagInSvg:
                    "${getIt<AppEnvVariables>().flagsBaseUrl}${e.code.substring(0, 2).toLowerCase()}.svg"))
            .toList() ??
        [];
  }
}
