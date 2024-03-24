import 'package:flutter/material.dart';
import 'dart:ui';

class BlurBox extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;

  const BlurBox({
    super.key,
    required this.blur,
    required this.opacity,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border:
                  Border.all(color: Colors.grey.withOpacity(0.1), width: 1)),
          child: child,
        ),
      ),
    );
  }
}
