import 'package:flutter/painting.dart';
import 'package:oracle_digital_internship/src/core/constants/colors/colors.dart';

abstract final class AppGradients {
  static const main = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [AppColors.mainGradientStart, AppColors.mainGradientEnd],
  );
}
