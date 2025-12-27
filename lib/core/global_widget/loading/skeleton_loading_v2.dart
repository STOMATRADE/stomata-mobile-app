import 'package:flutter/cupertino.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';

class SkeletonLoadingV2 extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  const SkeletonLoadingV2({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        height: height ?? 10,
        width: width,
        decoration: BoxDecoration(
          color: ColorUtils.skeletonLoadingColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
      ),
    );
  }
}
