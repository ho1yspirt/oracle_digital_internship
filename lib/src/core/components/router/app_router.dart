import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_digital_internship/src/features/auth/bloc/auth/auth_bloc.dart';
import 'package:oracle_digital_internship/src/features/auth/presentation/screens/login_screen.dart';
import 'package:oracle_digital_internship/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:oracle_digital_internship/src/features/chats/presentation/screens/chats_screen.dart';
import 'package:oracle_digital_internship/src/features/chats/presentation/screens/single_chat_screen.dart';
import 'package:oracle_digital_internship/src/features/discover/presentation/screens/discover_screen.dart';
import 'package:oracle_digital_internship/src/features/discover/presentation/screens/photo_view_screen.dart';
import 'package:oracle_digital_internship/src/features/initial/presentation/screens/initial_screen.dart';
import 'package:oracle_digital_internship/src/features/main_wrapper/presentation/screens/main_wrapper_screen.dart';
import 'package:oracle_digital_internship/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:oracle_digital_internship/src/features/search/presentation/screens/search_screen.dart';

/// Application routing component
class AppRouter {
  AppRouter(this.authBloc) {
    authBloc.add(GetAuthStatusEvent());
  }
  final AuthBloc authBloc;

  /// Global navigation key for routing outside the app.
  ///
  /// Use carefully, BuildContext may not be accessible everywhere.
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.discover,
    redirect: (context, state) {
      final currentLocation = state.matchedLocation;
      final authStatus = authBloc.state is Authenticated;
      if (!authStatus) {
        if (currentLocation == Routes.initial ||
            currentLocation == Routes.login ||
            currentLocation == Routes.signup) {
          return null;
        } else {
          return Routes.initial;
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    routes: [
      GoRoute(
        name: Routes.initial,
        path: Routes.initial,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const InitialScreen(),
      ),
      GoRoute(
        name: Routes.login,
        path: Routes.login,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: Routes.signup,
        path: Routes.signup,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const SignupScreen(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => MainWrapperScreen(
          cartCounter: 0,
          child: child,
        ),
        routes: [
          GoRoute(
            name: Routes.discover,
            path: Routes.discover,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DiscoverScreen(),
            ),
          ),
          GoRoute(
            name: Routes.search,
            path: Routes.search,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchScreen(),
            ),
          ),
          GoRoute(
            name: Routes.create,
            path: Routes.create,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: Scaffold(),
            ),
          ),
          GoRoute(
            name: Routes.chats,
            path: Routes.chats,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ChatsScreen(),
            ),
            routes: [
              GoRoute(
                name: Routes.singleChat,
                path: '${Routes.singleChat}/:id',
                parentNavigatorKey: shellNavigatorKey,
                builder: (context, state) => SingleChatScreen(
                  id: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          GoRoute(
            name: Routes.profile,
            path: Routes.profile,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        name: Routes.photoViewer,
        path: '${Routes.photoViewer}/:id',
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: PhotoViewScreen(id: state.pathParameters['id']!),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.decelerate).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

abstract final class Routes {
  Routes._();

  // auth
  static const initial = '/';
  static const login = '/login';
  static const signup = '/signup';

  // main wrapper
  static const discover = '/discover';
  static const search = '/search';
  static const create = '/create';
  static const chats = '/chats';
  static const profile = '/profile';

  // photo viewer
  static const photoViewer = '/photoViewer';

  // chats
  static const singleChat = 'singleChat';
}
