import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../home/presntation/view/widgets/b estsellerlistviewitem.dart';
import 'custom_search_text_fild.dart';

class  SearchVirwBody extends StatelessWidget {
  const  SearchVirwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [CustomSearchTixtField (),
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
    return ListView.builder(


      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(),
        );
      },
    );
  }
}
