part of 'search_result_cubit.dart';

sealed class SearchResultState extends Equatable {
  const SearchResultState();

  @override
  List<Object> get props => [];
}

final class SearchResultInitial extends SearchResultState {}

class SearchResultLoading extends SearchResultState {}

class SearchResultFailure extends SearchResultState {
  final String message;

  const SearchResultFailure(this.message);

  @override
  List<Object> get props => [message];
}

class SearchResultSuccess extends SearchResultState {
  final List<BookModel> books;
  final List<String> searchHistory;

  const SearchResultSuccess(this.books, this.searchHistory);

  @override
  List<Object> get props => [books, searchHistory];
}
