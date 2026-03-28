import 'package:bookly/Features/home/data/models/BookModel.dart';
import 'package:bookly/Features/home/presntation/view/widgets/custom_list_view_item.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';

import '../../../../../core/utils/styles.dart';
import 'bookrating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra:bookModel );
      },
      child: SizedBox(height:120 ,
        child: Row(
          children: [
            CustomListViewItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??''),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [ SizedBox(
                  width: MediaQuery.of(context).size.width *.5,
                  child: Text(bookModel.volumeInfo.title??'',maxLines:2,
                    overflow:TextOverflow.ellipsis,
                    style: Styles.textstyle20.copyWith(fontFamily: kGtSectraFine),),
                ),
                  SizedBox(height: 3,),
                  Text(
                    (bookModel.volumeInfo.authors != null && bookModel.volumeInfo.authors!.isNotEmpty)
                        ? bookModel.volumeInfo.authors![0]
                        : 'Unknown Author',
                    style: Styles.textstyle14,
                  ),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Text('Free',style:Styles.textstyle20.copyWith(fontWeight:FontWeight.bold)
                        ),
                      Spacer(),
                      BookRating(
                        count: bookModel.volumeInfo.ratingsCount?? 0,
                        rating: (bookModel.volumeInfo.averageRating?? 0).toDouble(),
                      ),
                    ],
                  ),
      
      
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


