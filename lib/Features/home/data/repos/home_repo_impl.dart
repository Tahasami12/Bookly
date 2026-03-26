import 'package:bookly/Features/home/data/models/BookModel.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooks()async {
    try {
      var data = await
      apiService.get(
          endPorint: "volumes?filter=free-ebooks&q=&q=subject:programming");
      List<BookModel> books = [];
      for (var item in data['item']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }
  catch(e) {
      return left(ServerFailure());
  }


  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturdBooks() {
    // TODO: implement fetchFeaturdBooks
    throw UnimplementedError();
  }
}