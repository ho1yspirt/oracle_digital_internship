import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:oracle_digital_internship/src/app/data/initialize_dependencies.dart';
import 'package:oracle_digital_internship/src/app/presentation/app.dart';
import 'package:oracle_digital_internship/src/app/presentation/app_error.dart';
import 'package:oracle_digital_internship/src/app/presentation/inherited_dependencies.dart';
import 'package:oracle_digital_internship/src/core/utils/app_bloc_observer.dart';
import 'package:oracle_digital_internship/src/core/utils/logger.dart';

abstract class IAppRunner {
  Future<void> preloadData();
  Future<void> run();
}

class AppRunner implements IAppRunner {
  AppRunner(this.env);

  final String env;

  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// only portrait mode
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    /// display refresh rate
    await FlutterDisplayMode.setHighRefreshRate();

    /// Bloc observer
    Bloc.observer = AppBlocObserver();
  }

  @override
  Future<void> run() async {
    await preloadData();
    initializeDependencies(env).then(
      (dependencies) => runApp(
        InheritedDependencies(dependencies: dependencies, child: const App()),
      ),
      onError: (Object error, StackTrace stackTrace) {
        if (!kDebugMode) {
          logger.e('Dependencies', error: error, stackTrace: stackTrace);
        }
        runApp(AppError(error: error));
      },
    );
  }
}
