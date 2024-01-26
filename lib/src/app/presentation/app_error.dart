import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Text(error.toString())));
  }
}
