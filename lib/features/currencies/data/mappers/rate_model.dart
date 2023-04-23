import 'package:currency_converter/features/currencies/data/models/rate_model.dart';
import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';

extension XRateModel on RateModel {
  ExchangeRate get storable {
    return ExchangeRate(code, exchangeRate.toDouble());
  }
}
