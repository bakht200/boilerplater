part of 'movie_detail_cubit.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movieDetail;
  const MovieDetailLoaded(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}
