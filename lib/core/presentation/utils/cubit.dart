import 'package:currency_converter/core/domain/entities/failures/failures.dart';
import 'package:currency_converter/generated/l10n.dart';

T errorStateFrom<T>(
  Failure failure, {
  required T Function(Type type, String message, bool isAction) determineError,
}) {
  if (failure is ClientFailure) {
    return failure.when(
      unknown: (message, isAction) =>
          determineError(Unknown, message, isAction),
      unauthorizedAccess: (isAction) =>
          determineError(UnAuthorizedAccess, "", isAction),
      networkError: (message, isAction) =>
          determineError(NetworkError, message, isAction),
      resourceNotFound: (message, isAction) =>
          determineError(ResourceNotFound, message, isAction),
      badRequest: (message, isAction) =>
          determineError(BadRequest, message, isAction),
      forbiddenAccess: (message, isAction) =>
          determineError(ForbiddenAccess, message, isAction),
    );
  } else if (failure is ServerFailure) {
    return failure.when(
      unknown: (message, isAction) =>
          determineError(UnknowServerFailure, message, isAction),
      internalError: (message, isAction) =>
          determineError(InternalError, message, isAction),
      serviceUnavailable: (message, isAction) => determineError(
        ServiceUnavailable,
        message,
        isAction,
      ),
    );
  } else {
    return determineError(
      GenericFailure,
      S.current.somethingIsWrong,
      (failure as GenericFailure).isAction,
    );
  }
}
