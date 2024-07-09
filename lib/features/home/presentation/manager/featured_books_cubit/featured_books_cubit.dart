import 'package:bloc/bloc.dart';
import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/repos/home_repo.dart';
import '../../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) => emit(FeaturedBooksFailure(failure.errorMessage)),
      (books) => emit(FeaturedBooksSucces(books)),
    );
  }

}
