import 'package:bookly/Features/home/presntation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetalisView extends StatelessWidget {
  const BookDetalisView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:SafeArea(child:  BookDetailsViewBody(),
        )
    );
  }
}
