part of 'upcoming_movies_cubit.dart';

class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesInitial extends UpcomingMoviesState {
  List<Object> get props => [];
}

class UpcomingMoviesLoading extends UpcomingMoviesState {
  final List<UpComingMovieModel> upcomingMovieList;
  const UpcomingMoviesLoading(this.upcomingMovieList);
}

class UpcomingMoviesLoaded extends UpcomingMoviesState {
  final List<UpComingMovieModel> upcomingMovieList;
  const UpcomingMoviesLoaded(this.upcomingMovieList);
}

class UpcomingMoviesSearchLoaded extends UpcomingMoviesState {
  final List<Result> upcomingMovieList;
  const UpcomingMoviesSearchLoaded(this.upcomingMovieList);
}

class UpcomingMoviesTimeout extends UpcomingMoviesState {
  List<Object> get props => [];
}

class UpcomingMoviesInternetError extends UpcomingMoviesState {
  List<Object> get props => [];
}

class UpcomingMoviesFailed extends UpcomingMoviesState {
  List<Object> get props => [];
}
