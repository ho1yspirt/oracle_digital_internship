import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_digital_internship/src/core/components/router/app_router.dart';
import 'package:oracle_digital_internship/src/core/constants/sizes/sizes.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';

class InitialButtons extends StatelessWidget {
  const InitialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.pDefault,
        vertical: AppSizes.p20,
      ),
      child: Row(children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              context.pushNamed(Routes.login);
            },
            child: Text(s.action_login.toUpperCase()),
          ),
        ),
        const SizedBox(width: AppSizes.p10),
        Expanded(
          child: FilledButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              context.pushNamed(Routes.signup);
            },
            child: Text(s.action_register.toUpperCase()),
          ),
        ),
      ]),
    );
  }
}
