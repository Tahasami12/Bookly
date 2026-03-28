import 'package:bookly/Features/home/presntation/manger/feature_books_bloc.dart';
import 'package:bookly/core/widgrts/custom_error_widgrt.dart';
import 'package:bookly/core/widgrts/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksBloc,FeatureBooksState>(
    builder: (context,state){
    if (state is FeatureBooksSuccess) {
      return SizedBox(
          height: MediaQuery.of(context).size.height* .3,
      
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return   Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kBookDetailsView, extra:state.books [index]);
                    },
                    child: CustomListViewItem(
                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                    ),
                  ),
                );
      
        }),
      
        );
    }else if(state is FeatureBooksFailure){
      return CustomErrorWidgrt(errMessage: state.errMessage);

    }else{
      return CustomLoadingIndicator();
    }
  },
    );
  }
}