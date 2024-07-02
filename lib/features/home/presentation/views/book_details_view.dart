import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetialsView extends StatefulWidget {
  final BookModel bookModel;
  const BookDetialsView({super.key, required this.bookModel});

  @override
  State<BookDetialsView> createState() => _BookDetialsViewState();
}

class _BookDetialsViewState extends State<BookDetialsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.bookModel.volumeInfo!.categories![0],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookDetialsViewBody()),
    );
  }
}
