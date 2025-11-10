import 'package:dio/dio.dart';

abstract class MessageService {
  void showNetworkError(DioException error);
  void showError(String message);
}
