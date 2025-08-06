import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryEffect extends StatelessWidget {
  final double opacity = 0.1;
  final double blurry = 1.2;
  final Color shade = Colors.grey.shade200;
  final Widget? child;

  BlurryEffect({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurry, sigmaY: blurry),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: shade.withValues(alpha:opacity)),
          child: child,
        ),
      ),
    );
  }
}
