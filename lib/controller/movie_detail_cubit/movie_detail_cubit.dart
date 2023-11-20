import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tentwenty_movie_project/constant/api_manager.dart';
import 'package:tentwenty_movie_project/constant/config.dart';
import 'package:tentwenty_movie_project/model/cast_list.dart';
import 'package:tentwenty_movie_project/model/movie_detail_model.dart';
import 'package:tentwenty_movie_project/model/movie_image_model.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());
  final Dio dio = Dio();
  ApiManager apiManager = ApiManager();

  getMovieDetail(movieId) async {
    emit(MovieDetailLoading());
    try {
      final response =
          await apiManager.getRequest(Config.baseUrl + '/movie/$movieId');
      MovieDetail movieDetail = MovieDetail.fromJson(response.data);

      movieDetail.trailerId = await getYoutubeId(movieId);

      movieDetail.movieImage = await getMovieImage(movieId);

      movieDetail.castList = await getCastList(movieId);

      emit(MovieDetailLoaded(movieDetail));
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<String> getYoutubeId(String id) async {
    try {
      final response =
          await apiManager.getRequest(Config.baseUrl + '/movie/$id/videos');
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<MovieImage> getMovieImage(String movieId) async {
    try {
      final response = await apiManager
          .getRequest(Config.baseUrl + '/movie/$movieId/images');
      return MovieImage.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Cast>> getCastList(String movieId) async {
    try {
      final response = await apiManager
          .getRequest(Config.baseUrl + '/movie/$movieId/credits');
      var list = response.data['cast'] as List;
      List<Cast> castList = list
          .map((c) => Cast(
              name: c['name'],
              profilePath: c['profile_path'],
              character: c['character']))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
