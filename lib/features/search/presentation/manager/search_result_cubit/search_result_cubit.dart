import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.homeRepo) : super(SearchResultInitial());

  final HomeRepo homeRepo;
  List<String> searchHistory = [];

  Future<void> fetchSearchResult(String query) async {
    if (query.isEmpty) return;
    
    searchHistory.add(query);
    emit(SearchResultLoading());

    Either<Failure, List<BookModel>> result =
        await homeRepo.fetchSearchResult(category: query);
    result.fold(
      (failure) => emit(SearchResultFailure(failure.errorMessage)),
      (books) => emit(SearchResultSuccess(books, List.from(searchHistory))),
    );
  }
}
