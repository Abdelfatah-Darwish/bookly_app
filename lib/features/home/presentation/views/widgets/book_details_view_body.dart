import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetialsViewBody extends StatelessWidget {
  const BookDetialsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomBookDetailsAppBar(),
              ),
              SizedBox(height: 33.2),
              BookDetailsSection(),
              Expanded(child: SizedBox(height: 49)),
              SimilarBooksSection(),
              SizedBox(height: 40),
            ],
          ),
        )
      ],
    );
  }
}
