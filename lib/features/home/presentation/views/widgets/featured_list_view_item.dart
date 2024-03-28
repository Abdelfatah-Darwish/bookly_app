import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  final double aspectRatio;
  const CustomBookImage({super.key, required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      // aspectRatio: 1.4 / 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
          image: const DecorationImage(
              image: AssetImage(
                AssetsData.testImage,
              ),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
