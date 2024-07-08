import '../../../../../core/utils/widgets/custom_error_widget.dart';
import '../../manager/newset_books/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import your cubit file
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(errorMessage: state.message);
        } else if (state is NewsetBooksSuccess) {
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
