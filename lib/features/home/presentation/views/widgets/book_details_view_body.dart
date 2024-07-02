import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetialsViewBody extends StatelessWidget {
  const BookDetialsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomBookDetailsAppBar(),
              ),
              const SizedBox(height: 33.2),
              BookDetailsSection(bookModel: bookModel),
              const Expanded(child: SizedBox(height: 49)),
              const SimilarBooksSection(),
              const SizedBox(height: 40),
            ],
          ),
        )
      ],
    );
  }
}
