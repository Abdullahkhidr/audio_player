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
              position: const Offset(0.1, 0.2), color: Colors.blueAccent),
          MeshGradientPoint(position: const Offset(0.5, 0.5), color: Colors.orange),
          MeshGradientPoint(position: const Offset(0.3, 0.2), color: Colors.yellow),
          MeshGradientPoint(position: const Offset(0.9, 0.6), color: Colors.green),
          MeshGradientPoint(position: const Offset(0.6, 0.7), color: Colors.red),
          MeshGradientPoint(position: const Offset(0.1, 0.8), color: kPrimaryColor),
        ],
        child: child);
  }
}
