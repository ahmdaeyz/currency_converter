import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';
import 'package:currency_converter/features/currencies/data/services/currency_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: CurrenciesLocalDataSource)
class CurrenciesLocalDataSourceImpl implements CurrenciesLocalDataSource {
  final CurrencyStorageService _service;

  CurrenciesLocalDataSourceImpl(this._service);

  @override
  Future<List<StorableCurrency>> getCurrencies() async {
    try {
      return _service.getCurrencies();
    } catch (e, s) {
      getIt<Logger>().w("", e, s);
      return [];
    }
  }

  @override
  Future<ExchangeRate?> getRate(
      {required String base, required String currency}) async {
    try {
      return _service.getRate(base: base, to: currency);
    } catch (e, s) {
      getIt<Logger>().w("", e, s);
      return null;
    }
  }

  @override
  void saveCurrencies({required List<StorableCurrency> currencies}) {
    try {
      return _service.saveCurrencies(currencies: currencies);
    } catch (e, s) {
      getIt<Logger>().w("", e, s);
    }
  }

  @override
  void saveExchangeRates(
      {required String code, required List<ExchangeRate> rates}) {
    try {
      return _service.saveExchangeRates(code: code, rates: rates);
    } catch (e, s) {
      getIt<Logger>().w("", e, s);
    }
  }
}

abstract class CurrenciesLocalDataSource {
  Future<List<StorableCurrency>> getCurrencies();

  Future<ExchangeRate?> getRate(
      {required String base, required String currency});

  void saveCurrencies({required List<StorableCurrency> currencies});

  void saveExchangeRates(
      {required String code, required List<ExchangeRate> rates});
}
