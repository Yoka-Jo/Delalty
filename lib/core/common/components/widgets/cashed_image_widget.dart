// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CashedImageWidget extends StatelessWidget {
  final String image;
  final Alignment alignment;
  final BoxFit? fit;
  final double? height;
  final double borderRadius;
  const CashedImageWidget({
    Key? key,
    required this.image,
    this.alignment = Alignment.center,
    this.fit,
    this.borderRadius = 0,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => const SizedBox.shrink(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        alignment: alignment,
        height: height,
        fit: fit,
      ),
    );
  }
}
