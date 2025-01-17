import '../../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count});

  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text(
          "$rating",
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 9),
        Opacity(
          opacity: 0.5,
          child: Text(
            " $count",
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
