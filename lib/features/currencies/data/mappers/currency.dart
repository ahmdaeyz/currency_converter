import 'package:currency_converter/features/currencies/data/models/storable_currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';

extension XCurrency on Currency {
  StorableCurrency get storable {
    return StorableCurrency(code, symbol, name, flagInSvg: flagInSvg);
  }
}
