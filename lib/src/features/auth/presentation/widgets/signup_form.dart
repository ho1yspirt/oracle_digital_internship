import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/sizes/sizes.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/core/widgets/widgets.dart';
import 'package:oracle_digital_internship/src/features/auth/bloc/auth/auth_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Form(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        EmailFormField(controller: _emailController),
        const SizedBox(height: AppSizes.pDefault),
        PasswordFormField(controller: _passwordController),
        const SizedBox(height: AppSizes.pDefault),
        Builder(
          builder: (context) => FilledButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              if (Form.of(context).validate()) {
                Dependencies.of(context).authBloc.add(SignupEvent(
                      _emailController.text,
                      _passwordController.text,
                    ));
              }
            },
            child: Text(s.action_next.toUpperCase()),
          ),
        ),
      ]),
    );
  }
}
