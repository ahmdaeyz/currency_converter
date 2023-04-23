import 'package:currency_converter/core/domain/entities/failures/failure.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency_historical_data.dart';
import 'package:currency_converter/features/currencies/domain/entities/rate.dart';
import 'package:dartz/dartz.dart';

abstract class CurrenciesRepository {
  Future<Either<Failure, List<Currency>>> getCurrencies();

  Future<Either<Failure, Rate>> getRate(
      {required Currency base, required Currency to});

  Future<Either<Failure, List<CurrencyHistoricalData>>>
      getWeekBackHistoricalData(
          {required String userBaseCurrency, required String currency});
}
