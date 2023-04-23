import 'package:realm/realm.dart';

part 'storable_currency.g.dart';

@RealmModel()
class _StorableCurrency {
  @PrimaryKey()
  late String code;
  late String symbol;
  late String name;
  late String? flagInSvg;

  late List<_ExchangeRate> rates;
}

@RealmModel()
class _ExchangeRate {
  @PrimaryKey()
  late String code;
  late double rate;
}
