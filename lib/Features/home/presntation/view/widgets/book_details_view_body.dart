import 'package:bookly/Features/home/presntation/view/widgets/bookrating.dart';
import 'package:bookly/Features/home/presntation/view/widgets/custom_list_view_item.dart';
import 'package:bookly/Features/home/presntation/view/widgets/featured_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'custem_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustemBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width *.2),
            child: const CustomListViewItem(),
          ),
          SizedBox(
            height: 43),
               Text("The Jungle Book", style: Styles.textstyle30.copyWith(fontWeight: FontWeight.normal)),
          SizedBox(
            height: 6,
          ),
          Text("Rudyard Kipling", style: Styles.textstyle18.copyWith(fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 18,
          ),

          BookRating(mainAxisAlignment: MainAxisAlignment.center,),
          

        ],
      ),
    );
  }
}
class BooksAction  extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

      ],
    );
  }
}

