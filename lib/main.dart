import 'dart:async';

import 'src/app/presentation/app_runner.dart';
import 'src/core/utils/logger.dart';

Future<void> main() async {
  const env = String.fromEnvironment('env', defaultValue: 'dev');

  runZonedGuarded(
    () async => AppRunner(env).run(),
    (error, stack) => logger.e('AppRunner', error: error, stackTrace: stack),
  );
}
