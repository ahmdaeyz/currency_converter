// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_converter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrencyConverterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Currency currency, CurrencySelectionType type)
        currencySelected,
    required TResult Function(String conversion) converted,
    required TResult Function(String message) errorInConversion,
    required TResult Function(String message) errorInCurrencies,
    required TResult Function(String message, ErrorInSelectionType type)
        errorInSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult? Function(String conversion)? converted,
    TResult? Function(String message)? errorInConversion,
    TResult? Function(String message)? errorInCurrencies,
    TResult? Function(String message, ErrorInSelectionType type)?
        errorInSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult Function(String conversion)? converted,
    TResult Function(String message)? errorInConversion,
    TResult Function(String message)? errorInCurrencies,
    TResult Function(String message, ErrorInSelectionType type)?
        errorInSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CurrencySelected value) currencySelected,
    required TResult Function(Converted value) converted,
    required TResult Function(ErrorInConversion value) errorInConversion,
    required TResult Function(ErrorInCurrencies value) errorInCurrencies,
    required TResult Function(ErrorInSelection value) errorInSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CurrencySelected value)? currencySelected,
    TResult? Function(Converted value)? converted,
    TResult? Function(ErrorInConversion value)? errorInConversion,
    TResult? Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult? Function(ErrorInSelection value)? errorInSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CurrencySelected value)? currencySelected,
    TResult Function(Converted value)? converted,
    TResult Function(ErrorInConversion value)? errorInConversion,
    TResult Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult Function(ErrorInSelection value)? errorInSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyConverterStateCopyWith<$Res> {
  factory $CurrencyConverterStateCopyWith(CurrencyConverterState value,
          $Res Function(CurrencyConverterState) then) =
      _$CurrencyConverterStateCopyWithImpl<$Res, CurrencyConverterState>;
}

/// @nodoc
class _$CurrencyConverterStateCopyWithImpl<$Res,
        $Val extends CurrencyConverterState>
    implements $CurrencyConverterStateCopyWith<$Res> {
  _$CurrencyConverterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$CurrencyConverterStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'CurrencyConverterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Currency currency, CurrencySelectionType type)
        currencySelected,
    required TResult Function(String conversion) converted,
    required TResult Function(String message) errorInConversion,
    required TResult Function(String message) errorInCurrencies,
    required TResult Function(String message, ErrorInSelectionType type)
        errorInSelection,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult? Function(String conversion)? converted,
    TResult? Function(String message)? errorInConversion,
    TResult? Function(String message)? errorInCurrencies,
    TResult? Function(String message, ErrorInSelectionType type)?
        errorInSelection,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult Function(String conversion)? converted,
    TResult Function(String message)? errorInConversion,
    TResult Function(String message)? errorInCurrencies,
    TResult Function(String message, ErrorInSelectionType type)?
        errorInSelection,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CurrencySelected value) currencySelected,
    required TResult Function(Converted value) converted,
    required TResult Function(ErrorInConversion value) errorInConversion,
    required TResult Function(ErrorInCurrencies value) errorInCurrencies,
    required TResult Function(ErrorInSelection value) errorInSelection,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CurrencySelected value)? currencySelected,
    TResult? Function(Converted value)? converted,
    TResult? Function(ErrorInConversion value)? errorInConversion,
    TResult? Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult? Function(ErrorInSelection value)? errorInSelection,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CurrencySelected value)? currencySelected,
    TResult Function(Converted value)? converted,
    TResult Function(ErrorInConversion value)? errorInConversion,
    TResult Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult Function(ErrorInSelection value)? errorInSelection,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements CurrencyConverterState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$CurrencySelectedCopyWith<$Res> {
  factory _$$CurrencySelectedCopyWith(
          _$CurrencySelected value, $Res Function(_$CurrencySelected) then) =
      __$$CurrencySelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({Currency currency, CurrencySelectionType type});
}

/// @nodoc
class __$$CurrencySelectedCopyWithImpl<$Res>
    extends _$CurrencyConverterStateCopyWithImpl<$Res, _$CurrencySelected>
    implements _$$CurrencySelectedCopyWith<$Res> {
  __$$CurrencySelectedCopyWithImpl(
      _$CurrencySelected _value, $Res Function(_$CurrencySelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? type = null,
  }) {
    return _then(_$CurrencySelected(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CurrencySelectionType,
    ));
  }
}

/// @nodoc

class _$CurrencySelected implements CurrencySelected {
  const _$CurrencySelected({required this.currency, required this.type});

  @override
  final Currency currency;
  @override
  final CurrencySelectionType type;

  @override
  String toString() {
    return 'CurrencyConverterState.currencySelected(currency: $currency, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencySelected &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencySelectedCopyWith<_$CurrencySelected> get copyWith =>
      __$$CurrencySelectedCopyWithImpl<_$CurrencySelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Currency currency, CurrencySelectionType type)
        currencySelected,
    required TResult Function(String conversion) converted,
    required TResult Function(String message) errorInConversion,
    required TResult Function(String message) errorInCurrencies,
    required TResult Function(String message, ErrorInSelectionType type)
        errorInSelection,
  }) {
    return currencySelected(currency, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult? Function(String conversion)? converted,
    TResult? Function(String message)? errorInConversion,
    TResult? Function(String message)? errorInCurrencies,
    TResult? Function(String message, ErrorInSelectionType type)?
        errorInSelection,
  }) {
    return currencySelected?.call(currency, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult Function(String conversion)? converted,
    TResult Function(String message)? errorInConversion,
    TResult Function(String message)? errorInCurrencies,
    TResult Function(String message, ErrorInSelectionType type)?
        errorInSelection,
    required TResult orElse(),
  }) {
    if (currencySelected != null) {
      return currencySelected(currency, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CurrencySelected value) currencySelected,
    required TResult Function(Converted value) converted,
    required TResult Function(ErrorInConversion value) errorInConversion,
    required TResult Function(ErrorInCurrencies value) errorInCurrencies,
    required TResult Function(ErrorInSelection value) errorInSelection,
  }) {
    return currencySelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CurrencySelected value)? currencySelected,
    TResult? Function(Converted value)? converted,
    TResult? Function(ErrorInConversion value)? errorInConversion,
    TResult? Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult? Function(ErrorInSelection value)? errorInSelection,
  }) {
    return currencySelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CurrencySelected value)? currencySelected,
    TResult Function(Converted value)? converted,
    TResult Function(ErrorInConversion value)? errorInConversion,
    TResult Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult Function(ErrorInSelection value)? errorInSelection,
    required TResult orElse(),
  }) {
    if (currencySelected != null) {
      return currencySelected(this);
    }
    return orElse();
  }
}

abstract class CurrencySelected implements CurrencyConverterState {
  const factory CurrencySelected(
      {required final Currency currency,
      required final CurrencySelectionType type}) = _$CurrencySelected;

  Currency get currency;
  CurrencySelectionType get type;
  @JsonKey(ignore: true)
  _$$CurrencySelectedCopyWith<_$CurrencySelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConvertedCopyWith<$Res> {
  factory _$$ConvertedCopyWith(
          _$Converted value, $Res Function(_$Converted) then) =
      __$$ConvertedCopyWithImpl<$Res>;
  @useResult
  $Res call({String conversion});
}

/// @nodoc
class __$$ConvertedCopyWithImpl<$Res>
    extends _$CurrencyConverterStateCopyWithImpl<$Res, _$Converted>
    implements _$$ConvertedCopyWith<$Res> {
  __$$ConvertedCopyWithImpl(
      _$Converted _value, $Res Function(_$Converted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversion = null,
  }) {
    return _then(_$Converted(
      conversion: null == conversion
          ? _value.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Converted implements Converted {
  const _$Converted({required this.conversion});

  @override
  final String conversion;

  @override
  String toString() {
    return 'CurrencyConverterState.converted(conversion: $conversion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Converted &&
            (identical(other.conversion, conversion) ||
                other.conversion == conversion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertedCopyWith<_$Converted> get copyWith =>
      __$$ConvertedCopyWithImpl<_$Converted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Currency currency, CurrencySelectionType type)
        currencySelected,
    required TResult Function(String conversion) converted,
    required TResult Function(String message) errorInConversion,
    required TResult Function(String message) errorInCurrencies,
    required TResult Function(String message, ErrorInSelectionType type)
        errorInSelection,
  }) {
    return converted(conversion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult? Function(String conversion)? converted,
    TResult? Function(String message)? errorInConversion,
    TResult? Function(String message)? errorInCurrencies,
    TResult? Function(String message, ErrorInSelectionType type)?
        errorInSelection,
  }) {
    return converted?.call(conversion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult Function(String conversion)? converted,
    TResult Function(String message)? errorInConversion,
    TResult Function(String message)? errorInCurrencies,
    TResult Function(String message, ErrorInSelectionType type)?
        errorInSelection,
    required TResult orElse(),
  }) {
    if (converted != null) {
      return converted(conversion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CurrencySelected value) currencySelected,
    required TResult Function(Converted value) converted,
    required TResult Function(ErrorInConversion value) errorInConversion,
    required TResult Function(ErrorInCurrencies value) errorInCurrencies,
    required TResult Function(ErrorInSelection value) errorInSelection,
  }) {
    return converted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CurrencySelected value)? currencySelected,
    TResult? Function(Converted value)? converted,
    TResult? Function(ErrorInConversion value)? errorInConversion,
    TResult? Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult? Function(ErrorInSelection value)? errorInSelection,
  }) {
    return converted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CurrencySelected value)? currencySelected,
    TResult Function(Converted value)? converted,
    TResult Function(ErrorInConversion value)? errorInConversion,
    TResult Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult Function(ErrorInSelection value)? errorInSelection,
    required TResult orElse(),
  }) {
    if (converted != null) {
      return converted(this);
    }
    return orElse();
  }
}

abstract class Converted implements CurrencyConverterState {
  const factory Converted({required final String conversion}) = _$Converted;

  String get conversion;
  @JsonKey(ignore: true)
  _$$ConvertedCopyWith<_$Converted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorInConversionCopyWith<$Res> {
  factory _$$ErrorInConversionCopyWith(
          _$ErrorInConversion value, $Res Function(_$ErrorInConversion) then) =
      __$$ErrorInConversionCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorInConversionCopyWithImpl<$Res>
    extends _$CurrencyConverterStateCopyWithImpl<$Res, _$ErrorInConversion>
    implements _$$ErrorInConversionCopyWith<$Res> {
  __$$ErrorInConversionCopyWithImpl(
      _$ErrorInConversion _value, $Res Function(_$ErrorInConversion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorInConversion(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorInConversion implements ErrorInConversion {
  const _$ErrorInConversion({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CurrencyConverterState.errorInConversion(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorInConversion &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorInConversionCopyWith<_$ErrorInConversion> get copyWith =>
      __$$ErrorInConversionCopyWithImpl<_$ErrorInConversion>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Currency currency, CurrencySelectionType type)
        currencySelected,
    required TResult Function(String conversion) converted,
    required TResult Function(String message) errorInConversion,
    required TResult Function(String message) errorInCurrencies,
    required TResult Function(String message, ErrorInSelectionType type)
        errorInSelection,
  }) {
    return errorInConversion(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult? Function(String conversion)? converted,
    TResult? Function(String message)? errorInConversion,
    TResult? Function(String message)? errorInCurrencies,
    TResult? Function(String message, ErrorInSelectionType type)?
        errorInSelection,
  }) {
    return errorInConversion?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult Function(String conversion)? converted,
    TResult Function(String message)? errorInConversion,
    TResult Function(String message)? errorInCurrencies,
    TResult Function(String message, ErrorInSelectionType type)?
        errorInSelection,
    required TResult orElse(),
  }) {
    if (errorInConversion != null) {
      return errorInConversion(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CurrencySelected value) currencySelected,
    required TResult Function(Converted value) converted,
    required TResult Function(ErrorInConversion value) errorInConversion,
    required TResult Function(ErrorInCurrencies value) errorInCurrencies,
    required TResult Function(ErrorInSelection value) errorInSelection,
  }) {
    return errorInConversion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CurrencySelected value)? currencySelected,
    TResult? Function(Converted value)? converted,
    TResult? Function(ErrorInConversion value)? errorInConversion,
    TResult? Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult? Function(ErrorInSelection value)? errorInSelection,
  }) {
    return errorInConversion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CurrencySelected value)? currencySelected,
    TResult Function(Converted value)? converted,
    TResult Function(ErrorInConversion value)? errorInConversion,
    TResult Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult Function(ErrorInSelection value)? errorInSelection,
    required TResult orElse(),
  }) {
    if (errorInConversion != null) {
      return errorInConversion(this);
    }
    return orElse();
  }
}

abstract class ErrorInConversion implements CurrencyConverterState {
  const factory ErrorInConversion({required final String message}) =
      _$ErrorInConversion;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorInConversionCopyWith<_$ErrorInConversion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorInCurrenciesCopyWith<$Res> {
  factory _$$ErrorInCurrenciesCopyWith(
          _$ErrorInCurrencies value, $Res Function(_$ErrorInCurrencies) then) =
      __$$ErrorInCurrenciesCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorInCurrenciesCopyWithImpl<$Res>
    extends _$CurrencyConverterStateCopyWithImpl<$Res, _$ErrorInCurrencies>
    implements _$$ErrorInCurrenciesCopyWith<$Res> {
  __$$ErrorInCurrenciesCopyWithImpl(
      _$ErrorInCurrencies _value, $Res Function(_$ErrorInCurrencies) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorInCurrencies(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorInCurrencies implements ErrorInCurrencies {
  const _$ErrorInCurrencies({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CurrencyConverterState.errorInCurrencies(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorInCurrencies &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorInCurrenciesCopyWith<_$ErrorInCurrencies> get copyWith =>
      __$$ErrorInCurrenciesCopyWithImpl<_$ErrorInCurrencies>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Currency currency, CurrencySelectionType type)
        currencySelected,
    required TResult Function(String conversion) converted,
    required TResult Function(String message) errorInConversion,
    required TResult Function(String message) errorInCurrencies,
    required TResult Function(String message, ErrorInSelectionType type)
        errorInSelection,
  }) {
    return errorInCurrencies(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult? Function(String conversion)? converted,
    TResult? Function(String message)? errorInConversion,
    TResult? Function(String message)? errorInCurrencies,
    TResult? Function(String message, ErrorInSelectionType type)?
        errorInSelection,
  }) {
    return errorInCurrencies?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult Function(String conversion)? converted,
    TResult Function(String message)? errorInConversion,
    TResult Function(String message)? errorInCurrencies,
    TResult Function(String message, ErrorInSelectionType type)?
        errorInSelection,
    required TResult orElse(),
  }) {
    if (errorInCurrencies != null) {
      return errorInCurrencies(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CurrencySelected value) currencySelected,
    required TResult Function(Converted value) converted,
    required TResult Function(ErrorInConversion value) errorInConversion,
    required TResult Function(ErrorInCurrencies value) errorInCurrencies,
    required TResult Function(ErrorInSelection value) errorInSelection,
  }) {
    return errorInCurrencies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CurrencySelected value)? currencySelected,
    TResult? Function(Converted value)? converted,
    TResult? Function(ErrorInConversion value)? errorInConversion,
    TResult? Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult? Function(ErrorInSelection value)? errorInSelection,
  }) {
    return errorInCurrencies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CurrencySelected value)? currencySelected,
    TResult Function(Converted value)? converted,
    TResult Function(ErrorInConversion value)? errorInConversion,
    TResult Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult Function(ErrorInSelection value)? errorInSelection,
    required TResult orElse(),
  }) {
    if (errorInCurrencies != null) {
      return errorInCurrencies(this);
    }
    return orElse();
  }
}

abstract class ErrorInCurrencies implements CurrencyConverterState {
  const factory ErrorInCurrencies({required final String message}) =
      _$ErrorInCurrencies;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorInCurrenciesCopyWith<_$ErrorInCurrencies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorInSelectionCopyWith<$Res> {
  factory _$$ErrorInSelectionCopyWith(
          _$ErrorInSelection value, $Res Function(_$ErrorInSelection) then) =
      __$$ErrorInSelectionCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, ErrorInSelectionType type});
}

/// @nodoc
class __$$ErrorInSelectionCopyWithImpl<$Res>
    extends _$CurrencyConverterStateCopyWithImpl<$Res, _$ErrorInSelection>
    implements _$$ErrorInSelectionCopyWith<$Res> {
  __$$ErrorInSelectionCopyWithImpl(
      _$ErrorInSelection _value, $Res Function(_$ErrorInSelection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
  }) {
    return _then(_$ErrorInSelection(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ErrorInSelectionType,
    ));
  }
}

/// @nodoc

class _$ErrorInSelection implements ErrorInSelection {
  const _$ErrorInSelection({required this.message, required this.type});

  @override
  final String message;
  @override
  final ErrorInSelectionType type;

  @override
  String toString() {
    return 'CurrencyConverterState.errorInSelection(message: $message, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorInSelection &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorInSelectionCopyWith<_$ErrorInSelection> get copyWith =>
      __$$ErrorInSelectionCopyWithImpl<_$ErrorInSelection>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Currency currency, CurrencySelectionType type)
        currencySelected,
    required TResult Function(String conversion) converted,
    required TResult Function(String message) errorInConversion,
    required TResult Function(String message) errorInCurrencies,
    required TResult Function(String message, ErrorInSelectionType type)
        errorInSelection,
  }) {
    return errorInSelection(message, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult? Function(String conversion)? converted,
    TResult? Function(String message)? errorInConversion,
    TResult? Function(String message)? errorInCurrencies,
    TResult? Function(String message, ErrorInSelectionType type)?
        errorInSelection,
  }) {
    return errorInSelection?.call(message, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Currency currency, CurrencySelectionType type)?
        currencySelected,
    TResult Function(String conversion)? converted,
    TResult Function(String message)? errorInConversion,
    TResult Function(String message)? errorInCurrencies,
    TResult Function(String message, ErrorInSelectionType type)?
        errorInSelection,
    required TResult orElse(),
  }) {
    if (errorInSelection != null) {
      return errorInSelection(message, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CurrencySelected value) currencySelected,
    required TResult Function(Converted value) converted,
    required TResult Function(ErrorInConversion value) errorInConversion,
    required TResult Function(ErrorInCurrencies value) errorInCurrencies,
    required TResult Function(ErrorInSelection value) errorInSelection,
  }) {
    return errorInSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CurrencySelected value)? currencySelected,
    TResult? Function(Converted value)? converted,
    TResult? Function(ErrorInConversion value)? errorInConversion,
    TResult? Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult? Function(ErrorInSelection value)? errorInSelection,
  }) {
    return errorInSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CurrencySelected value)? currencySelected,
    TResult Function(Converted value)? converted,
    TResult Function(ErrorInConversion value)? errorInConversion,
    TResult Function(ErrorInCurrencies value)? errorInCurrencies,
    TResult Function(ErrorInSelection value)? errorInSelection,
    required TResult orElse(),
  }) {
    if (errorInSelection != null) {
      return errorInSelection(this);
    }
    return orElse();
  }
}

abstract class ErrorInSelection implements CurrencyConverterState {
  const factory ErrorInSelection(
      {required final String message,
      required final ErrorInSelectionType type}) = _$ErrorInSelection;

  String get message;
  ErrorInSelectionType get type;
  @JsonKey(ignore: true)
  _$$ErrorInSelectionCopyWith<_$ErrorInSelection> get copyWith =>
      throw _privateConstructorUsedError;
}
