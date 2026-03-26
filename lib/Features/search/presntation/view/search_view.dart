

import 'package:bookly/Features/search/presntation/view/search_virw_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: SearchVirwBody()) ,
    );
  }
}
