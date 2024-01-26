import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.title,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
  });

  final String title;
  final double topLeftRadius;
  final double topRightRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.03),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
          bottomLeft: const Radius.circular(AppSizes.rDefault),
          bottomRight: const Radius.circular(AppSizes.rDefault),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.pDefault),
        child: Text(title, style: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }
}
