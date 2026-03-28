import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/presntation/manger/search_dart_state.dart';


import '../../data/repos/home_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;

  SearchCubit(this.homeRepo) : super(SearchInitial());

  Future<void> search(String query) async {
    emit(SearchLoading());

    var result = await homeRepo.fetchSearchBooks(query: query);

    result.fold(
          (failure) => emit(SearchFailure(failure.errMessage)),
          (books) => emit(SearchSuccess(books)),
    );
  }
}
