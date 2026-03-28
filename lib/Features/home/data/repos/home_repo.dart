import 'package:bookly/Features/home/data/models/BookModel.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
 Future <Either<Failures,List<BookModel>>>fetchBestSellerBooks();
 Future<Either<Failures,List<BookModel>>>fetchFeaturdBooks();
 Future<Either<Failures,List<BookModel>>>fetchSimilarBooks({required String category});
 Future<Either<Failures, List<BookModel>>> fetchSearchBooks({
  required String query,
 });
}