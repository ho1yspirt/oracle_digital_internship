import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/components/router/app_router.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/auth/bloc/auth/auth_bloc.dart';
import 'package:oracle_digital_internship/src/features/auth/presentation/widgets/signup_confirm_form.dart';
import 'package:oracle_digital_internship/src/features/auth/presentation/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
            S.of(context).register,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.pDefault),
          sliver: SliverToBoxAdapter(
            child: BlocConsumer<AuthBloc, AuthState>(
              bloc: Dependencies.of(context).authBloc,
              listener: (context, state) {
                if (state is Authenticated) context.goNamed(Routes.discover);
              },
              builder: (context, state) {
                if (state is Registered) return const SignupConfirmForm();
                return const SignupForm();
              },
            ),
          ),
        ),
      ]),
    );
  }
}
