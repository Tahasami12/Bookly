import 'package:bookly/Features/home/presntation/manger/smila_books_cubit.dart';
import 'package:bookly/core/widgrts/custom_error_widgrt.dart';
import 'package:bookly/core/widgrts/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmilaBooksCubit, SmilaBooksState>(
      builder: (context, state) {
        if (state is SmilaBooksSuccess) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .15,
          
            child: ListView.builder(itemCount:state.books.length ,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: CustomListViewItem(
                        imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                    ),
                  );
                }
            ),
          );
        }else if(state is SmilaBooksFailure){
          return CustomErrorWidgrt(errMessage: state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
