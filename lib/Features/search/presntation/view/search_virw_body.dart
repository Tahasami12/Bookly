import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presntation/manger/search_dart_cubit.dart';
import '../../../home/presntation/manger/search_dart_state.dart';
import '../../../home/presntation/view/widgets/b estsellerlistviewitem.dart';
import 'custom_search_text_fild.dart';

class  SearchVirwBody extends StatelessWidget {
  const  SearchVirwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(


        children: [CustomSearchTextField(),
          const SizedBox(
            height: 16,
          ),Text(" Search Result",style: Styles.textstyle18),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: SearchResultListView())],
      ),
    );
  }
}
class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {

        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }


        else if (state is SearchFailure) {
          return Center(child: Text(state.errMessage));
        }


        else if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  bookModel: book,
                ),
              );
            },
          );
        }


        else {
          return const Center(child: Text("Search something..."));
        }
      },
    );
  }
}