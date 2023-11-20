part of 'movie_category_cubit.dart';

class MovieCategoryState extends Equatable {
  const MovieCategoryState();

  @override
  List<Object> get props => [];
}

class MovieCategoryInitial extends MovieCategoryState {}

class MovieCategoryLoading extends MovieCategoryState {}

class MovieCategoryLoaded extends MovieCategoryState {
  final List<MovieCategory> movieCategoryList;
  const MovieCategoryLoaded(this.movieCategoryList);
}

class MovieCategoryTimeout extends MovieCategoryState {
  List<Object> get props => [];
}

class MovieCategoryInternetError extends MovieCategoryState {
  List<Object> get props => [];
}

class MovieCategoryFailed extends MovieCategoryState {
  List<Object> get props => [];
}
