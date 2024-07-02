import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'buttons_book_details_view.dart';
import 'custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.28),
          child: CustomBookImage(
            aspectRatio: 2 / 3,
            imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                'https://images.pexels.com/photos/26631544/pexels-photo-26631544/free-photo-of-birds.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo!.title!,
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 4),
        Text(
          bookModel.volumeInfo!.authors?.first ?? 'Unknown Author',
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 14),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: 4.8,
          count: 2390,
        ),
        const SizedBox(height: 37),
        const ButtonsBook(),
      ],
    );
  }
}
