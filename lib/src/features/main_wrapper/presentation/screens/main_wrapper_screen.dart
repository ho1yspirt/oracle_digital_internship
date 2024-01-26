import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/components/router/app_router.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/auth/bloc/auth/auth_bloc.dart';

class MainWrapperScreen extends StatelessWidget {
  const MainWrapperScreen({
    super.key,
    required this.child,
    required this.cartCounter,
  });

  final Widget child;
  final int cartCounter;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex(context),
        destinations: [
          NavigationDestination(
            icon: const Icon(CupertinoIcons.home),
            selectedIcon: const Icon(CupertinoIcons.home),
            label: s.discover,
            tooltip: s.discover,
          ),
          NavigationDestination(
            icon: const Icon(CupertinoIcons.search),
            selectedIcon: const Icon(CupertinoIcons.search),
            label: s.search,
            tooltip: s.search,
          ),
          NavigationDestination(
            icon: const DecoratedBox(
              decoration: ShapeDecoration(
                gradient: AppGradients.main,
                shape: StadiumBorder(),
              ),
              child: SizedBox(
                width: 70,
                height: 40,
                child: Icon(CupertinoIcons.plus, color: AppColors.white),
              ),
            ),
            label: s.create,
            tooltip: s.create,
          ),
          NavigationDestination(
            icon: const Icon(CupertinoIcons.chat_bubble),
            selectedIcon: const Icon(CupertinoIcons.chat_bubble),
            label: s.chats,
            tooltip: s.chats,
          ),
          NavigationDestination(
            icon: const Icon(CupertinoIcons.person),
            selectedIcon: const Icon(CupertinoIcons.person),
            label: s.profile,
            tooltip: s.profile,
          ),
        ],
        onDestinationSelected: (newIndex) => _onDestinationSelected(
          context,
          newIndex,
        ),
      ),
    );
  }

  int _selectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location == Routes.discover) {
      return 0;
    }
    if (location == Routes.search) {
      return 1;
    }
    if (location == Routes.create) {
      return 2;
    }
    if (location == Routes.chats) {
      return 3;
    }
    if (location == Routes.profile) {
      return 4;
    }
    return 0;
  }

  void _onDestinationSelected(BuildContext context, int index) {
    HapticFeedback.lightImpact();
    switch (index) {
      case 0:
        context.goNamed(Routes.discover);
      case 1:
        context.goNamed(Routes.search);
      case 2:
        {
          //! test functionality
          if (kDebugMode) Dependencies.of(context).authBloc.add(LogoutEvent());
        }
      case 3:
        context.goNamed(Routes.chats);
      case 4:
        context.goNamed(Routes.profile);
      default:
        context.goNamed(Routes.discover);
    }
  }
}
