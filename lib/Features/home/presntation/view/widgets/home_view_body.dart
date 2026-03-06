import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'b estsellerlistviewitem.dart';
import 'bestsellerlistview.dart';
import 'custom_app_bar.dart';
import 'custom_list_view_item.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),

              FeaturedBooksListView(),
              SizedBox(
                  height: 50
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text("Bast Seller",
                    style: Styles.textstyle18),
              ),
              SizedBox(
                height: 20,
              ),




            ],
          ),

        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        )
      ],
    );

  }
}


