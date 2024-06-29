// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';



class CustomBookImage extends StatelessWidget {
  const CustomBookImage(
      {super.key, required this.aspectRatio, required this.imageUrl});
  final double aspectRatio;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      // aspectRatio: 1.4 / 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
