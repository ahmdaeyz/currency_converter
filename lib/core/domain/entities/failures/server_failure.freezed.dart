// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServerFailure {
  String get message => throw _privateConstructorUsedError;
  bool get isAction => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, bool isAction) unknown,
    required TResult Function(String message, bool isAction) internalError,
    required TResult Function(String message, bool isAction) serviceUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, bool isAction)? unknown,
    TResult? Function(String message, bool isAction)? internalError,
    TResult? Function(String message, bool isAction)? serviceUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, bool isAction)? unknown,
    TResult Function(String message, bool isAction)? internalError,
    TResult Function(String message, bool isAction)? serviceUnavailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknowServerFailure value) unknown,
    required TResult Function(InternalError value) internalError,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknowServerFailure value)? unknown,
    TResult? Function(InternalError value)? internalError,
    TResult? Function(ServiceUnavailable value)? serviceUnavailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknowServerFailure value)? unknown,
    TResult Function(InternalError value)? internalError,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerFailureCopyWith<ServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerFailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(
          ServerFailure value, $Res Function(ServerFailure) then) =
      _$ServerFailureCopyWithImpl<$Res, ServerFailure>;
  @useResult
  $Res call({String message, bool isAction});
}

/// @nodoc
class _$ServerFailureCopyWithImpl<$Res, $Val extends ServerFailure>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isAction = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isAction: null == isAction
          ? _value.isAction
          : isAction // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnknowServerFailureCopyWith<$Res>
    implements $ServerFailureCopyWith<$Res> {
  factory _$$UnknowServerFailureCopyWith(_$UnknowServerFailure value,
          $Res Function(_$UnknowServerFailure) then) =
      __$$UnknowServerFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool isAction});
}

/// @nodoc
class __$$UnknowServerFailureCopyWithImpl<$Res>
    extends _$ServerFailureCopyWithImpl<$Res, _$UnknowServerFailure>
    implements _$$UnknowServerFailureCopyWith<$Res> {
  __$$UnknowServerFailureCopyWithImpl(
      _$UnknowServerFailure _value, $Res Function(_$UnknowServerFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isAction = null,
  }) {
    return _then(_$UnknowServerFailure(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isAction: null == isAction
          ? _value.isAction
          : isAction // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UnknowServerFailure implements UnknowServerFailure {
  const _$UnknowServerFailure({required this.message, this.isAction = false});

  @override
  final String message;
  @override
  @JsonKey()
  final bool isAction;

  @override
  String toString() {
    return 'ServerFailure.unknown(message: $message, isAction: $isAction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknowServerFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isAction, isAction) ||
                other.isAction == isAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknowServerFailureCopyWith<_$UnknowServerFailure> get copyWith =>
      __$$UnknowServerFailureCopyWithImpl<_$UnknowServerFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, bool isAction) unknown,
    required TResult Function(String message, bool isAction) internalError,
    required TResult Function(String message, bool isAction) serviceUnavailable,
  }) {
    return unknown(message, isAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, bool isAction)? unknown,
    TResult? Function(String message, bool isAction)? internalError,
    TResult? Function(String message, bool isAction)? serviceUnavailable,
  }) {
    return unknown?.call(message, isAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, bool isAction)? unknown,
    TResult Function(String message, bool isAction)? internalError,
    TResult Function(String message, bool isAction)? serviceUnavailable,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, isAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknowServerFailure value) unknown,
    required TResult Function(InternalError value) internalError,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknowServerFailure value)? unknown,
    TResult? Function(InternalError value)? internalError,
    TResult? Function(ServiceUnavailable value)? serviceUnavailable,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknowServerFailure value)? unknown,
    TResult Function(InternalError value)? internalError,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknowServerFailure implements ServerFailure {
  const factory UnknowServerFailure(
      {required final String message,
      final bool isAction}) = _$UnknowServerFailure;

  @override
  String get message;
  @override
  bool get isAction;
  @override
  @JsonKey(ignore: true)
  _$$UnknowServerFailureCopyWith<_$UnknowServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternalErrorCopyWith<$Res>
    implements $ServerFailureCopyWith<$Res> {
  factory _$$InternalErrorCopyWith(
          _$InternalError value, $Res Function(_$InternalError) then) =
      __$$InternalErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool isAction});
}

/// @nodoc
class __$$InternalErrorCopyWithImpl<$Res>
    extends _$ServerFailureCopyWithImpl<$Res, _$InternalError>
    implements _$$InternalErrorCopyWith<$Res> {
  __$$InternalErrorCopyWithImpl(
      _$InternalError _value, $Res Function(_$InternalError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isAction = null,
  }) {
    return _then(_$InternalError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isAction: null == isAction
          ? _value.isAction
          : isAction // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InternalError implements InternalError {
  const _$InternalError({required this.message, this.isAction = false});

  @override
  final String message;
  @override
  @JsonKey()
  final bool isAction;

  @override
  String toString() {
    return 'ServerFailure.internalError(message: $message, isAction: $isAction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isAction, isAction) ||
                other.isAction == isAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternalErrorCopyWith<_$InternalError> get copyWith =>
      __$$InternalErrorCopyWithImpl<_$InternalError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, bool isAction) unknown,
    required TResult Function(String message, bool isAction) internalError,
    required TResult Function(String message, bool isAction) serviceUnavailable,
  }) {
    return internalError(message, isAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, bool isAction)? unknown,
    TResult? Function(String message, bool isAction)? internalError,
    TResult? Function(String message, bool isAction)? serviceUnavailable,
  }) {
    return internalError?.call(message, isAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, bool isAction)? unknown,
    TResult Function(String message, bool isAction)? internalError,
    TResult Function(String message, bool isAction)? serviceUnavailable,
    required TResult orElse(),
  }) {
    if (internalError != null) {
      return internalError(message, isAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknowServerFailure value) unknown,
    required TResult Function(InternalError value) internalError,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
  }) {
    return internalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknowServerFailure value)? unknown,
    TResult? Function(InternalError value)? internalError,
    TResult? Function(ServiceUnavailable value)? serviceUnavailable,
  }) {
    return internalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknowServerFailure value)? unknown,
    TResult Function(InternalError value)? internalError,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    required TResult orElse(),
  }) {
    if (internalError != null) {
      return internalError(this);
    }
    return orElse();
  }
}

abstract class InternalError implements ServerFailure {
  const factory InternalError(
      {required final String message, final bool isAction}) = _$InternalError;

  @override
  String get message;
  @override
  bool get isAction;
  @override
  @JsonKey(ignore: true)
  _$$InternalErrorCopyWith<_$InternalError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceUnavailableCopyWith<$Res>
    implements $ServerFailureCopyWith<$Res> {
  factory _$$ServiceUnavailableCopyWith(_$ServiceUnavailable value,
          $Res Function(_$ServiceUnavailable) then) =
      __$$ServiceUnavailableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool isAction});
}

/// @nodoc
class __$$ServiceUnavailableCopyWithImpl<$Res>
    extends _$ServerFailureCopyWithImpl<$Res, _$ServiceUnavailable>
    implements _$$ServiceUnavailableCopyWith<$Res> {
  __$$ServiceUnavailableCopyWithImpl(
      _$ServiceUnavailable _value, $Res Function(_$ServiceUnavailable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isAction = null,
  }) {
    return _then(_$ServiceUnavailable(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isAction: null == isAction
          ? _value.isAction
          : isAction // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServiceUnavailable implements ServiceUnavailable {
  const _$ServiceUnavailable({required this.message, this.isAction = false});

  @override
  final String message;
  @override
  @JsonKey()
  final bool isAction;

  @override
  String toString() {
    return 'ServerFailure.serviceUnavailable(message: $message, isAction: $isAction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceUnavailable &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isAction, isAction) ||
                other.isAction == isAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceUnavailableCopyWith<_$ServiceUnavailable> get copyWith =>
      __$$ServiceUnavailableCopyWithImpl<_$ServiceUnavailable>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, bool isAction) unknown,
    required TResult Function(String message, bool isAction) internalError,
    required TResult Function(String message, bool isAction) serviceUnavailable,
  }) {
    return serviceUnavailable(message, isAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, bool isAction)? unknown,
    TResult? Function(String message, bool isAction)? internalError,
    TResult? Function(String message, bool isAction)? serviceUnavailable,
  }) {
    return serviceUnavailable?.call(message, isAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, bool isAction)? unknown,
    TResult Function(String message, bool isAction)? internalError,
    TResult Function(String message, bool isAction)? serviceUnavailable,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(message, isAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknowServerFailure value) unknown,
    required TResult Function(InternalError value) internalError,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
  }) {
    return serviceUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknowServerFailure value)? unknown,
    TResult? Function(InternalError value)? internalError,
    TResult? Function(ServiceUnavailable value)? serviceUnavailable,
  }) {
    return serviceUnavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknowServerFailure value)? unknown,
    TResult Function(InternalError value)? internalError,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(this);
    }
    return orElse();
  }
}

abstract class ServiceUnavailable implements ServerFailure {
  const factory ServiceUnavailable(
      {required final String message,
      final bool isAction}) = _$ServiceUnavailable;

  @override
  String get message;
  @override
  bool get isAction;
  @override
  @JsonKey(ignore: true)
  _$$ServiceUnavailableCopyWith<_$ServiceUnavailable> get copyWith =>
      throw _privateConstructorUsedError;
}
