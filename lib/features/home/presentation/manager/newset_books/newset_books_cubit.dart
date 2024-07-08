import 'package:bloc/bloc.dart';
import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/repos/home_repo.dart';

import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewestBooksCubit extends Cubit<NewsetBooksState> {
  final HomeRepo homeRepo;

  NewestBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  Future<void> fetchBestSellerBooks() async {
    emit(NewsetBooksLoading());

    final result = await homeRepo.fetchBestSellerBooks();
    result.fold(
      (failure) => emit(NewsetBooksFailure(failure.errorMessage)),
      (books) => emit(NewsetBooksSuccess(books)),
    );
  }
}
