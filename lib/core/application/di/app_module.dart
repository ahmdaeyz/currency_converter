import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/data/data_sources/env_variables.dart';
import 'package:currency_converter/core/data/interceptors/api_key_appender_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class AppModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage {
    const androidOptions = AndroidOptions(
      encryptedSharedPreferences: true,
    );
    const storage = FlutterSecureStorage(aOptions: androidOptions);

    return storage;
  }

  @lazySingleton
  Logger get logger => Logger(
        printer: PrettyPrinter(),
      );

  @lazySingleton
  Dio get dio {
    final aDio = Dio(BaseOptions(
        baseUrl: getIt<AppEnvVariables>().baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(
          seconds: 30,
        ),
        sendTimeout: const Duration(
          seconds: 30,
        ),
        followRedirects: true));

    aDio.interceptors.addAll([
      ApiKeyAppenderInterceptor(),
    ]);
    if (kDebugMode) {
      aDio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (log) => getIt<Logger>().v(log.toString()),
        ),
      );
    }
    return aDio;
  }
}
