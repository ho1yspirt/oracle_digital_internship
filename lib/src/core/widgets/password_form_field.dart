import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = false;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: s.hint_password,
        suffixIcon: IconButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            setState(() => _obscureText = !_obscureText);
          },
          icon: Icon(
            _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          ),
        ),
      ),
      autofillHints: const [AutofillHints.password],
      validator: (value) {
        if (value == null || value.isEmpty) return s.error_empty;
        if (value.characters.length < 8) return s.error_weak_password;
        return null;
      },
    );
  }
}
