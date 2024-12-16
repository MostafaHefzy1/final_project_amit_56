import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final BorderRadiusGeometry? border;
  final BoxShape shape;
  final BoxFit fit;
  final ColorFilter? colorFilter;
  final bool isPerson;
  const CustomNetworkImage(
      {super.key,
      required this.image,
      this.width = double.infinity,
      this.height = 180,
      this.border,
      this.shape = BoxShape.rectangle,
      this.fit = BoxFit.cover,
      this.colorFilter,
      this.isPerson = false});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image.toString(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: border,
          image: DecorationImage(
              image: imageProvider, fit: fit, colorFilter: colorFilter),
          shape: shape,
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: border, shape: shape),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      height: height,
      fit: BoxFit.cover,
      width: width,
    );
  }
}
