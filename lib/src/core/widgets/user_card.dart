import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/core/constants/colors/colors.dart';
import 'package:oracle_digital_internship/src/core/constants/sizes/sizes.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.username,
    required this.nickname,
    required this.imageUrl,
    this.foregroundColor = AppColors.black,
  });

  final String username;
  final String nickname;
  final String imageUrl;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(foregroundImage: CachedNetworkImageProvider(imageUrl)),
      const SizedBox(width: AppSizes.p8),
      Wrap(direction: Axis.vertical, children: [
        Text(
          username,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: foregroundColor),
        ),
        Text(
          nickname,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontSize: 11, color: foregroundColor),
        ),
      ]),
    ]);
  }
}
