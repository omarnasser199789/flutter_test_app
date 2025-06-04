import 'package:flutter/material.dart';

class BackgroundGlows extends StatelessWidget {
  const BackgroundGlows({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _BackgroundGlows(),
        child,
      ],
    );
  }
}

// Background widget containing glowing effects
class _BackgroundGlows extends StatelessWidget {
  const _BackgroundGlows();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _GlowingEllipse(
              width: 100,
              height: 100,
              color: Colors.tealAccent.withOpacity(1),
              blurRadius: 200,
              spreadRadius: 100,
              borderRadius: size.width,
            ),
          ],
        ),
        SizedBox(height: size.height * 0.3),
        Row(
          children: [
            _GlowingEllipse(
              width: 100,
              height: 100,
              color: Colors.tealAccent.withOpacity(0.6),
              blurRadius: 200,
              spreadRadius: 100,
              borderRadius: size.width,
            ),
          ],
        ),
      ],
    );
  }
}

// Reusable glowing ellipse widget with customizable properties
class _GlowingEllipse extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double blurRadius;
  final double spreadRadius;
  final double borderRadius;

  const _GlowingEllipse({
    required this.width,
    required this.height,
    required this.color,
    required this.blurRadius,
    required this.spreadRadius,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ],
      ),
    );
  }
}
