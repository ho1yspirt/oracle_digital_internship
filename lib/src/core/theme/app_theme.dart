import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/core/constants/colors/colors.dart';
import 'package:oracle_digital_internship/src/core/constants/fonts/fonts.dart';
import 'package:oracle_digital_internship/src/core/constants/sizes/sizes.dart';

class AppTheme {
  final ThemeData base = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textTheme: const TextTheme(
      titleLarge: AppFonts.titleLarge,
      bodyMedium: AppFonts.bodyMedium,
      bodySmall: AppFonts.bodySmall,
      labelLarge: AppFonts.labelLarge,
      labelMedium: AppFonts.labelMedium,
      labelSmall: AppFonts.labelSmall,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.p18),
        side: const BorderSide(width: AppSizes.strokeDefault),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.rDefault),
        ),
        textStyle: AppFonts.labelLarge,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.p18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.rDefault),
        ),
        textStyle: AppFonts.labelLarge,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 1,
      shadowColor: Colors.black,
      color: AppColors.white,
      surfaceTintColor: Colors.transparent,
      actionsIconTheme: CupertinoIconThemeData(),
      iconTheme: CupertinoIconThemeData(),
      titleTextStyle: AppFonts.titleLarge,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppFonts.bodySmall,
      contentPadding: const EdgeInsets.all(17),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.rDefault),
        borderSide: const BorderSide(
          width: AppSizes.strokeDefault,
          color: Colors.red,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.rDefault),
        borderSide: const BorderSide(
          width: AppSizes.strokeDefault,
          color: Colors.red,
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(width: AppSizes.strokeDefault),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: AppSizes.strokeDefault),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: AppSizes.strokeDefault),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: AppSizes.strokeDefault),
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      elevation: 10,
      shadowColor: Colors.black,
      indicatorShape: CircleBorder(),
      iconTheme: MaterialStatePropertyAll(
        IconThemeData(color: AppColors.black),
      ),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
    ),
  );

  late final ThemeData light = base.copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.black,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: Colors.red,
      onError: AppColors.white,
      background: AppColors.white,
      onBackground: AppColors.black,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: base.outlinedButtonTheme.style?.copyWith(
        foregroundColor: const MaterialStatePropertyAll(Colors.black),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: base.outlinedButtonTheme.style?.copyWith(
        backgroundColor: const MaterialStatePropertyAll(Colors.black),
      ),
    ),
  );

  late final ThemeData dark = base.copyWith(
    brightness: Brightness.dark,
    // colorScheme: ColorScheme(
    //   brightness: Brightness.dark,
    //   primary: primary,
    //   onPrimary: onPrimary,
    //   secondary: secondary,
    //   onSecondary: onSecondary,
    //   error: error,
    //   onError: onError,
    //   background: background,
    //   onBackground: onBackground,
    //   surface: surface,
    //   onSurface: onSurface,
    // ),
  );
}
