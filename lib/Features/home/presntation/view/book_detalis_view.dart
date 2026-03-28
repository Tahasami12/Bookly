import 'package:bookly/Features/home/data/models/BookModel.dart';
import 'package:bookly/Features/home/presntation/manger/smila_books_cubit.dart';
import 'package:bookly/Features/home/presntation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetalisView extends StatefulWidget {
  const BookDetalisView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetalisView> createState() => _BookDetalisViewState();
}

class _BookDetalisViewState extends State<BookDetalisView> {
  @override
  void initState(){
    BlocProvider.of<SmilaBooksCubit>(context).fetchSimilarBooks(widget.bookModel.volumeInfo.categories![0])
        
    ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:SafeArea(child:  BookDetailsViewBody(
          book: widget.bookModel,
        ),
        )
    );
  }
}
