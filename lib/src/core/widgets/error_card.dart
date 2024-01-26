import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({
    super.key,
    required this.e,
    required this.s,
  });

  final Object e;
  final StackTrace s;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(e.toString()),
        Text(s.toString()),
      ]),
    );
  }
}
