import 'package:bookly/Features/home/data/models/BookModel.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presntation/manger/smila_books_cubit.dart';
import 'package:bookly/Features/home/presntation/view/book_detalis_view.dart';
import 'package:bookly/Features/home/presntation/view/home_view.dart';
import 'package:bookly/Features/search/presntation/view/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/view/splash_view.dart';
import '../../service_locator.dart';

abstract class AppRouter {
  static const khomeview ='/homeView';
  static const kBookDetailsView ='/bookDetailsView';
  static const KSearchView ='/searchview';
  static final router =  GoRouter(
    routes: [
      GoRoute(path: '/',
    builder: (context ,state) => SplashView(),
      ),
      GoRoute(path: '/searchview',
        builder: (context ,state) => SearchView(),
      ),
      GoRoute(path: khomeview,
        builder: (context ,state) => HomeView(),
      ),
      GoRoute(path: kBookDetailsView,
        builder: (context ,state) => BlocProvider(create: (context) => SmilaBooksCubit(getIt.get<HomeRepoImpl>(),
        ),
            child: BookDetalisView(
              bookModel: state.extra as BookModel,
            )),
      ),
    ],
  );

}