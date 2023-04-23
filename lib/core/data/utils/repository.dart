import 'package:currency_converter/core/data/mappers/application_exception.dart';
import 'package:currency_converter/core/data/models/exceptions/application_exception.dart';
import 'package:currency_converter/core/domain/entities/failures/failure.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:dartz/dartz.dart';

Future<Either<Failure, R>> conclude<R>(
  Future<R> Function() target, {
  String? context,
}) async {
  try {
    return Right(await target());
  } on ApplicationException catch (e) {
    return Left(
      dioExceptionsDecoder(e, () {}),
    );
  } catch (e) {
    return Left(GenericFailure(message: S.current.somethingIsWrong));
  }
}
