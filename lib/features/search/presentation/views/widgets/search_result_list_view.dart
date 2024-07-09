import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/newset_books/newset_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search_result_cubit/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (state is SearchResultLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchResultFailure) {
          return CustomErrorWidget(errorMessage: state.message);
        } else if (state is SearchResultSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final book = state.books[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(bookModel: book),
              );
            },
          );
        } else {
          return const Center(child: Text('No books available'));
        }
      },
    );
  }
}
