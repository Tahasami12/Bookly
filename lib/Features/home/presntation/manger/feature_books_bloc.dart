import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';

import '../../data/models/BookModel.dart';

part 'feature_books_state.dart';

class FeatureBooksBloc extends Cubit<FeatureBooksState> {
  FeatureBooksBloc(this.homeRepo) : super(FeatureBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatureBooksLoading());


    var result = await homeRepo.fetchFeaturdBooks();

    result.fold(
          (failure) {
        emit(FeatureBooksFailure(failure.errMessage));
      },
          (books) {
        emit(FeatureBooksSuccess(books));
      },
    );
  }
}

