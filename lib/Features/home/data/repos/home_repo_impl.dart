import 'package:bookly/Features/home/data/models/BookModel.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  bool isValidBook(BookModel book) {
    return book.volumeInfo.title != null &&
        book.volumeInfo.title!.isNotEmpty &&
        book.volumeInfo.imageLinks?.thumbnail != null &&
        book.volumeInfo.previewLink != null &&
        book.volumeInfo.previewLink!.isNotEmpty;
  }
  @override
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooks()async {
    try {
      var data = await
      apiService.get(
          endPorint:"volumes?q=subject:fiction&maxResults=40");

      List<BookModel> books = [];
      var items = data['items'];
     for ( var item in items) {
       try{
         books.add(BookModel.fromJson(item));
       }catch(e){

       }
     }


    return right(books);
  } catch (e) {
  if (e is DioException) {
  return left(ServerFailure.fromDioException(e));
  }
  return left(ServerFailure(e.toString()));
  }
}




  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturdBooks()async {
    try {
      var data = await
      apiService.get(
          endPorint: "volumes?q=subject:programming&orderBy=newest&key=AIzaSyB-YQXqhukeQ1abyUyBfZ-S3wnoWDRZV5k");

      List<BookModel> books = [];

      var items = data['items'] ;

      if (items is List) {
        books = items
            .map((item) => BookModel.fromJson(item))
            .toList();
      }
      return right(books);
    }
    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({required String category})async {
    try {
      var data = await
      apiService.get(
          endPorint: "volumes?Sorting=relevance&q=subject:programming&orderBy=newest&key=AIzaSyB-YQXqhukeQ1abyUyBfZ-S3wnoWDRZV5k");

      List<BookModel> books = [];

      var items = data['items'] ;

      if (items is List) {
        books = items
            .map((item) => BookModel.fromJson(item))
            .toList();
      }
      return right(books);
    }
    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchBooks({
    required String query,
  }) async {
    try {
      var data = await apiService.get(
        endPorint: "volumes?q=$query&maxResults=40",
      );

      List<BookModel> books = [];
      var items = data['items'];

      if (items != null && items is List) {
        for (var item in items) {
          try {
            final book = BookModel.fromJson(item);


            if (isValidBook(book)) {
              books.add(book);
            }

          } catch (e) {
            continue;
          }
        }
      }

      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  }


  