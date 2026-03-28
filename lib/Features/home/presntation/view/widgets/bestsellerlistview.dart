import 'package:bookly/Features/home/presntation/manger/newset_books_cubit.dart';
import 'package:bookly/core/widgrts/custom_error_widgrt.dart';
import 'package:bookly/core/widgrts/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'b estsellerlistviewitem.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,

            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        }else if (state is NewsetBooksFailure){
          return CustomErrorWidgrt(errMessage: state.errMessage);
        }else{
          return CustomLoadingIndicator();
        }
      },
    );
  }
}