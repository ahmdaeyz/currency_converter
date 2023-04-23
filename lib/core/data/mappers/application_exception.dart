import 'package:currency_converter/core/data/models/exceptions/application_exception.dart';
import 'package:currency_converter/core/data/models/exceptions/client_exception.dart';
import 'package:currency_converter/core/data/models/exceptions/server_exception.dart';
import 'package:currency_converter/core/domain/entities/failures/client_failure.dart';
import 'package:currency_converter/core/domain/entities/failures/failure.dart';
import 'package:currency_converter/core/domain/entities/failures/server_failure.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/foundation.dart';

Failure dioExceptionsDecoder(
    ApplicationException e, VoidCallback unauthorizedAccessHandler,
    {bool Function()? isAction}) {
  final isAnAction = isAction != null && isAction.call();
  if (e is ClientException) {
    return e.when(
      unknown: (message) =>
          ClientFailure.unknown(message: message, isAction: isAnAction),
      resourceNotFound: (resourceName, message) =>
          ClientFailure.resourceNotFound(
              message: message, isAction: isAnAction),
      unauthorizedAccess: () {
        unauthorizedAccessHandler();
        return ClientFailure.unauthorizedAccess(isAction: isAnAction);
      },
      networkError: (String message) =>
          ClientFailure.networkError(message: message, isAction: isAnAction),
      badRequest: (message) =>
          ClientFailure.badRequest(message: message, isAction: isAnAction),
      forbiddenAccess: (String message) => ClientFailure.forbiddenAccess(
        message: message,
        isAction: isAnAction,
      ),
    );
  } else if (e is ServerException) {
    return e.when(
      unknown: (message) =>
          ServerFailure.unknown(message: message, isAction: isAnAction),
      internalError: (message) =>
          ServerFailure.internalError(message: message, isAction: isAnAction),
      serviceUnavailable: (message) => ServerFailure.serviceUnavailable(
        message: message,
        isAction: isAnAction,
      ),
    );
  } else {
    return GenericFailure(
        message: S.current.somethingIsWrong, isAction: isAnAction);
  }
}
