import 'package:flutter/material.dart';

class OnboardingBackground extends StatelessWidget {
  final String imagePath;

  const OnboardingBackground({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

// // Dark Gradient Overlay
// Positioned.fill(
//   child: Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           Colors.transparent,
//           AppTheme.blackColor,
//           AppTheme.blackColor,
//         ],
//         stops: const [0.3, 0.7, 1.0],
//       ),
//     ),
//   ),
// ),