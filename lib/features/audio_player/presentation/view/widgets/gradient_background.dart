import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MeshGradient(
        options: MeshGradientOptions(),
        points: [
          MeshGradientPoint(
            color: kPrimaryColor,
            position: const Offset(0.1, 0.2),
          ),
          MeshGradientPoint(
            color: Color.lerp(kPrimaryColor, Colors.white, 0.7)!,
            position: const Offset(0.5, 0.5),
          ),
          MeshGradientPoint(
            color: kPrimaryColor,
            position: const Offset(0.9, 0.8),
          ),
        ],
        child: child);
  }
}
