

import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/search/presntation/view/search_virw_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../../home/data/repos/home_repo.dart';
import '../../../home/presntation/manger/search_dart_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: BlocProvider(

        create: (context) => SearchCubit(getIt<HomeRepoImpl>()),
        child: SafeArea(
          child: SearchVirwBody(),
        ),
      ),
    );
  }
}