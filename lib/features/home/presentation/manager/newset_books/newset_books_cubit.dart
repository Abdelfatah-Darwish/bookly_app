import 'package:bloc/bloc.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  final HomeRepo homeRepo;

  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  Future<void> fetchBestSellerBooks() async {
    emit(NewsetBooksLoading());

    final result = await homeRepo.fetchBestSellerBooks();
    result.fold(
      (failure) => emit(NewsetBooksFailure(failure.errorMessage)),
      (books) => emit(NewsetBooksSuccess(books)),
    );
  }
}
