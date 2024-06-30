import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'buttons_book_details_view.dart';
import 'custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.28),
          child: const CustomBookImage(aspectRatio: 2 / 3, imageUrl: 'https://images.pexels.com/photos/26631544/pexels-photo-26631544/free-photo-of-birds.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),
        ),
        const SizedBox(height: 43),
        const Text(
          'The Jungle Book',
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 4),
        Text(
          'Rudyard Kipling',
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 14),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center, rating: 5, count: 246,
        ),
        const SizedBox(height: 37),
        const ButtonsBook(),
      ],
    );
  }
}
