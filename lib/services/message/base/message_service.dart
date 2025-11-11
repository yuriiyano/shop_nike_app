import 'package:dio/dio.dart';

abstract interface class MessageService {
  void showNetworkError(DioException error);
  void showError(String message);
}
