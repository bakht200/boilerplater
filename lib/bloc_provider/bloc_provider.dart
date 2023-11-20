import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_movie_project/controller/movie_category_cubits/movie_category_cubit.dart';
import 'package:tentwenty_movie_project/controller/movie_category_cubits/searchbar_cubit/search_bar_cubit.dart';

import 'package:tentwenty_movie_project/controller/upcoming_movie_cubit/upcoming_movies_cubit.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<UpcomingMoviesCubit>(
        create: (context) => UpcomingMoviesCubit()..getUpComingMovieList()),
    BlocProvider<MovieCategoryCubit>(create: (context) => MovieCategoryCubit()),
    BlocProvider<SearchBarCubit>(create: (context) => SearchBarCubit()),
  ];
}
