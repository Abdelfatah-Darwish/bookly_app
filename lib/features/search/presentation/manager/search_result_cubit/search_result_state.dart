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

}

class SearchResultSuccess extends SearchResultState {
  final List<BookModel> books;

  const SearchResultSuccess(this.books);

  @override
  List<Object> get props => [books];
}
