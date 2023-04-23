import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';

extension XStorableCurrency on StorableCurrency {
  Currency get domain {
    return Currency(
        code: code, symbol: symbol, name: name, flagInSvg: flagInSvg);
  }
}
