import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';

class InheritedDependencies extends InheritedWidget {
  const InheritedDependencies({
    super.key,
    required super.child,
    required this.dependencies,
  });

  final Dependencies dependencies;

  static Dependencies? maybeOf(BuildContext context) => (context
          .getElementForInheritedWidgetOfExactType<InheritedDependencies>()
          ?.widget as InheritedDependencies?)
      ?.dependencies;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a InheritedDependencies of the exact type',
        'out_of_scope',
      );

  static Dependencies of(BuildContext context) =>
      maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedDependencies oldWidget) {
    return false;
  }
}
