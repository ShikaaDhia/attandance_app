// menampilkan sebuah error dengan cara kejelasan

import 'package:attandance_app/ui/permission/components/snack_bar.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  static void handleError(BuildContext context, dynamic error) {
    if (error is PermissionDeniedException) {
      SnackBarComponent.showSnackBar(
        context,
        "Permission Denied",
        isError: true,
      );
    } else {
      SnackBarComponent.showSnackBar(
        context,
        error,
        isError: true,
      );
    }
    Navigator.of(context).pop();
  }
}

class PermissionDeniedException implements Exception {
  final String message;

// proses pembuatan placeholder dri sebuah exception/error
  PermissionDeniedException([this.message = '']);

  @override
  String toString() => message.isEmpty ? "Permission Denied" : message;
}