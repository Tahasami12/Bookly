part of 'smila_books_cubit.dart';
abstract class SmilaBooksState  extends Equatable {
  const SmilaBooksState();

  @override
  List<Object?> get props => [];
}


 class SmilaBooksInitial extends SmilaBooksState {}
class SmilaBooksFailure extends SmilaBooksState {
  final String errMessage;

  SmilaBooksFailure(this.errMessage);
}
class SmilaBooksSuccess extends SmilaBooksState {
  final List<BookModel> books;

  SmilaBooksSuccess(this.books);
}
class SmilaBooksLoading extends SmilaBooksState {}
