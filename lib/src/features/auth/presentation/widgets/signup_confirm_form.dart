import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/auth/bloc/auth/auth_bloc.dart';

class SignupConfirmForm extends StatefulWidget {
  const SignupConfirmForm({super.key});

  @override
  State<SignupConfirmForm> createState() => _SignupConfirmFormState();
}

class _SignupConfirmFormState extends State<SignupConfirmForm> {
  late final TextEditingController _nicknameController;
  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController();
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final s = S.of(context);

    return Form(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextFormField(
          controller: _nicknameController,
          decoration: InputDecoration(hintText: s.hint_nick),
          autofillHints: const [AutofillHints.nickname],
          validator: (value) {
            if (value == null || value.isEmpty) return s.error_empty;
            return null;
          },
        ),
        const SizedBox(height: AppSizes.pDefault),
        Builder(
          builder: (context) => FilledButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              if (Form.of(context).validate()) {
                Dependencies.of(context).authBloc.add(SignupConfirmEvent(
                      _nicknameController.text,
                    ));
              }
            },
            child: Text(s.action_signup.toUpperCase()),
          ),
        ),
        const SizedBox(height: AppSizes.p32),
        Text.rich(
          TextSpan(text: '${s.terms_and_policy} ', children: [
            TextSpan(
              text: s.terms_of_service,
              style: textTheme.labelSmall?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(text: ' ${s.and.toLowerCase()} '),
            TextSpan(
              text: s.privac_policy,
              style: textTheme.labelSmall?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ]),
          style: textTheme.labelSmall,
        ),
      ]),
    );
  }
}
