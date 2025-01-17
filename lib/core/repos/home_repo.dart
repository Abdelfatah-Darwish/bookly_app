import '../../../../core/errors/failures.dart';
import '../models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
//for Book details screen.
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});

  Future<Either<Failure, List<BookModel>>> fetchSearchResult(
      {required String category});
}
