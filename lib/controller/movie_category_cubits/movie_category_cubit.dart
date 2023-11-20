import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tentwenty_movie_project/constant/api_manager.dart';
import 'package:tentwenty_movie_project/constant/config.dart';
import 'package:tentwenty_movie_project/model/movie_category_model.dart';

part 'movie_category_state.dart';

class MovieCategoryCubit extends Cubit<MovieCategoryState> {
  MovieCategoryCubit() : super(MovieCategoryInitial());

  ApiManager apiManager = ApiManager();

  getMovieCategoryList() async {
    emit(MovieCategoryLoading());
    try {
      Response responseData = await apiManager.getRequest(
          Config.baseUrl + Routes.movieCategoryList + "?language=en-US");

      if (responseData.statusCode == 200) {
        var decodedList = MovieCategory.fromJson(responseData.data);

        emit(MovieCategoryLoaded([decodedList]));
      }
    } on SocketException {
      emit(MovieCategoryInternetError());
    } on TimeoutException {
      emit(MovieCategoryTimeout());
    } catch (e) {
      print(e);
      emit(MovieCategoryFailed());
    }
  }
}
