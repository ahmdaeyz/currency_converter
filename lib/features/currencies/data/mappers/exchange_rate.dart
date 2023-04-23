import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/rate.dart';

extension XExchangeRate on ExchangeRate {
  Rate get domain {
    return Rate(currentRate: rate);
  }
}
