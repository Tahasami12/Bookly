import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/BookModel.dart';
import '../../data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit({required this.homeRepo}) : super(NewsetBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewsetdBooks() async {
    emit(NewsetBooksLoading());


    var result = await homeRepo.fetchBestSellerBooks();

    result.fold(
          (failure) {
        emit(NewsetBooksFailure(failure.errMessage));
      },
          (books) {
        emit(NewsetBooksSuccess(books));
      },
    );
  }
}
