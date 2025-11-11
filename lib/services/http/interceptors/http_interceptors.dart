import 'package:dio/dio.dart';

import 'package:shop_nike_app/services/index.dart';

class HttpInterceptor extends Interceptor {
  final Logger logger;
  final MessageService messageService;

  HttpInterceptor(this.logger, this.messageService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ...put auth token here';
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.logError(err, err.stackTrace);
    messageService.showNetworkError(err);
    return super.onError(err, handler);
  }
}
