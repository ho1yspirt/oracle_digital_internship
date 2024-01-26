import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: s.hint_email),
      autofillHints: const [AutofillHints.email],
      validator: (value) {
        if (value == null || value.isEmpty) return s.error_empty;
        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(value)) return s.error_wrong_email;
        return null;
      },
    );
  }
}
