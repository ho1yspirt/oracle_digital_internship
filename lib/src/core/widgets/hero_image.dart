import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    required this.imageUrl,
    this.onTap,
  });

  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
