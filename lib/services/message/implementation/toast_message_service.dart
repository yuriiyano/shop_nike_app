import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:shop_nike_app/styles/index.dart';

import '../index.dart';

@Singleton(scope: 'auth', as: MessageService)
class ToastMessageService implements MessageService {
  @override
  void showNetworkError(DioException error) {
    showError(_getNetworkErrorMessage(error));
  }

  @override
  void showError(String message) {
    BotToast.showCustomNotification(
      toastBuilder: (_) {
        return ToastMessage(
          message: message,
          icon: Icons.cancel,
          color: const Color.fromARGB(255, 175, 58, 50),
          textColor: Colors.white,
        );
      },
    );
  }

  String _getNetworkErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return _getStatusCodeMessage(error.response?.statusCode);
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.badCertificate:
        return 'Security certificate error.';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  String _getStatusCodeMessage(int? statusCode) {
    return switch (statusCode) {
      400 => 'Invalid request. Please check your input.',
      401 => 'Authentication failed. Please log in again.',
      403 => "Access denied. You don't have permission.",
      404 => 'Resource not found.',
      422 => 'Validation error. Please check your input.',
      500 => 'Server error. Please try again later.',
      502 ||
      503 ||
      504 => 'Service temporarily unavailable. Please try again later.',
      _ => 'Something went wrong. Please try again.',
    };
  }
}

class ToastMessage extends StatelessWidget {
  const ToastMessage({
    super.key,
    required this.message,
    required this.icon,
    required this.color,
    required this.textColor,
  });

  final String message;
  final IconData icon;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final darkerColor = Color.alphaBlend(
      const Color.fromARGB(98, 0, 0, 0),
      color,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: darkerColor,
          border: Border.all(width: 2, color: color),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 18,
                ),
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
