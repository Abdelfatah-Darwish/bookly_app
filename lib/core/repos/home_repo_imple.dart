// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeRepo {
  final ApiService apiService;
  HomeRepoImple(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=flutter');
      List<BookModel> books = [];
      for (var singelItem in data['items']) {
        BookModel bookModel = BookModel.fromJson(singelItem);
        books.add(bookModel);
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=computer network');
      List<BookModel> books = [];
      for (var singelItem in data['items']) {
        BookModel bookModel = BookModel.fromJson(singelItem);
        books.add(bookModel);
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks &Sorting=relevence &q=$category');
      List<BookModel> books = [];
      for (var singelItem in data['items']) {
        BookModel bookModel = BookModel.fromJson(singelItem);
        books.add(bookModel);
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResult(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$category');
      List<BookModel> books = [];
      for (var singelItem in data['items']) {
        BookModel bookModel = BookModel.fromJson(singelItem);
        books.add(bookModel);
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
