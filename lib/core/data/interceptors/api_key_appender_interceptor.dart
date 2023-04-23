import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/data/data_sources/env_variables.dart';
import 'package:dio/dio.dart';

/// Adds the api key as a query parameter as required by the APIs
class ApiKeyAppenderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiKey = getIt<AppEnvVariables>().apiKey;

    options.queryParameters.addAll({"apikey": apiKey});
    super.onRequest(options, handler);
  }
}
