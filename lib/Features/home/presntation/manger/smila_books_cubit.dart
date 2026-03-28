import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/BookModel.dart';
import '../../data/repos/home_repo.dart';

part 'smila_books_state.dart';

class SmilaBooksCubit extends Cubit<SmilaBooksState> {
  SmilaBooksCubit( this.homeRepo) : super(SmilaBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks ( String category)async {
    emit(SmilaBooksLoading());


    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
          (failure) {
        emit(SmilaBooksFailure(failure.errMessage));
      },
          (books) {
        emit(SmilaBooksSuccess(books));
      },
    );
  }
}
