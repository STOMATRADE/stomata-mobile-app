import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonLoading extends StatelessWidget {
  final bool loading;
  final Widget child;
  const SkeletonLoading({
    super.key,
    required this.loading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: loading, ignoreContainers: true, child: child);
  }
}
