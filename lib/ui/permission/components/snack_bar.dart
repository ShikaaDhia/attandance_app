import 'package:flutter/material.dart';

class SnackBarComponent {
  // static model --> untk mempertahankan value dri function yg dipanggil
  static void showSnackBar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      backgroundColor: isError ? Colors.red : Colors.blue,
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
  }
}