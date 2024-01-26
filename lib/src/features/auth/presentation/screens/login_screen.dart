import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_digital_internship/src/core/constants/sizes/sizes.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(slivers: [
        SliverAppBar.large(
          leading: IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            icon: const Icon(CupertinoIcons.arrow_turn_up_left),
          ),
          title: Text(
            S.of(context).login,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pDefault),
          sliver: SliverToBoxAdapter(child: LoginForm()),
        ),
      ]),
    );
  }
}
