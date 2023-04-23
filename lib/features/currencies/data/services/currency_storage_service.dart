import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';

abstract class CurrencyStorageService {
  void saveCurrencies({required List<StorableCurrency> currencies});

  void saveExchangeRates(
      {required String code, required List<ExchangeRate> rates});

  void clear();

  ExchangeRate? getRate({required String base, required String to});

  List<StorableCurrency> getCurrencies();

  void cleanUp();
}
