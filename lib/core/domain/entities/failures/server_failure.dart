import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:currency_converter/core/domain/entities/failures/failure.dart';

part 'server_failure.freezed.dart';

@freezed
abstract class ServerFailure extends Failure with _$ServerFailure {
  const factory ServerFailure.unknown({
    required String message,
    @Default(false) bool isAction,
  }) = UnknowServerFailure;

  const factory ServerFailure.internalError({
    required String message,
    @Default(false) bool isAction,
  }) = InternalError;

  const factory ServerFailure.serviceUnavailable({
    required String message,
    @Default(false) bool isAction,
  }) = ServiceUnavailable;
}
