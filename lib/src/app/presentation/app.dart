import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/colors/colors.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Dependencies.of(context).appTheme;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // AppColors.white
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Oracle Digital Internship Project by Amir Asakeev (ho1yspirt)',
      // localization
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // themes
      theme: appTheme.light,
      // darkTheme: appTheme.dark,
      // routes
      routerConfig: Dependencies.of(context).appRouter.router,
    );
  }
}
