// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storable_currency.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class StorableCurrency extends _StorableCurrency
    with RealmEntity, RealmObjectBase, RealmObject {
  StorableCurrency(
    String code,
    String symbol,
    String name, {
    String? flagInSvg,
    Iterable<ExchangeRate> rates = const [],
  }) {
    RealmObjectBase.set(this, 'code', code);
    RealmObjectBase.set(this, 'symbol', symbol);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'flagInSvg', flagInSvg);
    RealmObjectBase.set<RealmList<ExchangeRate>>(
        this, 'rates', RealmList<ExchangeRate>(rates));
  }

  StorableCurrency._();

  @override
  String get code => RealmObjectBase.get<String>(this, 'code') as String;
  @override
  set code(String value) => RealmObjectBase.set(this, 'code', value);

  @override
  String get symbol => RealmObjectBase.get<String>(this, 'symbol') as String;
  @override
  set symbol(String value) => RealmObjectBase.set(this, 'symbol', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get flagInSvg =>
      RealmObjectBase.get<String>(this, 'flagInSvg') as String?;
  @override
  set flagInSvg(String? value) => RealmObjectBase.set(this, 'flagInSvg', value);

  @override
  RealmList<ExchangeRate> get rates =>
      RealmObjectBase.get<ExchangeRate>(this, 'rates')
          as RealmList<ExchangeRate>;
  @override
  set rates(covariant RealmList<ExchangeRate> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<StorableCurrency>> get changes =>
      RealmObjectBase.getChanges<StorableCurrency>(this);

  @override
  StorableCurrency freeze() =>
      RealmObjectBase.freezeObject<StorableCurrency>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(StorableCurrency._);
    return const SchemaObject(
        ObjectType.realmObject, StorableCurrency, 'StorableCurrency', [
      SchemaProperty('code', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('symbol', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('flagInSvg', RealmPropertyType.string, optional: true),
      SchemaProperty('rates', RealmPropertyType.object,
          linkTarget: 'ExchangeRate', collectionType: RealmCollectionType.list),
    ]);
  }
}

class ExchangeRate extends _ExchangeRate
    with RealmEntity, RealmObjectBase, RealmObject {
  ExchangeRate(
    String code,
    double rate,
  ) {
    RealmObjectBase.set(this, 'code', code);
    RealmObjectBase.set(this, 'rate', rate);
  }

  ExchangeRate._();

  @override
  String get code => RealmObjectBase.get<String>(this, 'code') as String;
  @override
  set code(String value) => RealmObjectBase.set(this, 'code', value);

  @override
  double get rate => RealmObjectBase.get<double>(this, 'rate') as double;
  @override
  set rate(double value) => RealmObjectBase.set(this, 'rate', value);

  @override
  Stream<RealmObjectChanges<ExchangeRate>> get changes =>
      RealmObjectBase.getChanges<ExchangeRate>(this);

  @override
  ExchangeRate freeze() => RealmObjectBase.freezeObject<ExchangeRate>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ExchangeRate._);
    return const SchemaObject(
        ObjectType.realmObject, ExchangeRate, 'ExchangeRate', [
      SchemaProperty('code', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('rate', RealmPropertyType.double),
    ]);
  }
}
