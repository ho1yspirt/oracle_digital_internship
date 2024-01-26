import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/core/constants/sizes/sizes.dart';

abstract final class AppFonts {
  static const main = 'Roboto';
  static const secondary = 'Comfortaa';

  /// button
  static const labelLarge = TextStyle(
    fontFamily: main,
    fontSize: AppSizes.lL,
    fontWeight: FontWeight.w900,
  );

  static const labelMedium = TextStyle(
    fontFamily: main,
    fontSize: AppSizes.lL,
    fontWeight: FontWeight.w700,
  );

  static const labelSmall = TextStyle(
    fontFamily: main,
    fontSize: AppSizes.lL,
    fontWeight: FontWeight.w400,
  );

  static const titleLarge = TextStyle(
    fontFamily: secondary,
    fontSize: AppSizes.tL,
    fontWeight: FontWeight.w400,
  );

  static const bodySmall = TextStyle(
    fontFamily: main,
    fontSize: AppSizes.bS,
    fontWeight: FontWeight.w400,
  );

  static const bodyMedium = TextStyle(
    fontFamily: main,
    fontSize: AppSizes.bM,
    fontWeight: FontWeight.w600,
  );
}
