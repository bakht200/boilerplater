import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:boilerplater_movie_project/constant/api_manager.dart';
import 'package:boilerplater_movie_project/constant/config.dart';
import 'package:boilerplater_movie_project/model/upcoming_movie_model.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  UpcomingMoviesCubit() : super(UpcomingMoviesInitial());

  ApiManager apiManager = ApiManager();
  List<UpComingMovieModel> listOfMovie = [];
  List<Result> searchList = [];

  getUpComingMovieList() async {
    emit(UpcomingMoviesLoading(listOfMovie));

    try {
      Response responseData = await apiManager.getRequest(
          Config.baseUrl + Routes.upcomingMovieList + "?language=en-US&page=1");

      if (responseData.statusCode == 200) {
        var decodedList = UpComingMovieModel.fromJson(responseData.data);
        listOfMovie = [decodedList];
        emit(UpcomingMoviesLoaded([decodedList]));
      }
    } on SocketException {
      emit(UpcomingMoviesInternetError());
    } on TimeoutException {
      emit(UpcomingMoviesTimeout());
    } catch (e) {
      print(e);
      emit(UpcomingMoviesFailed());
    }
  }

  searchMovieTitle(String query) {
    emit(UpcomingMoviesLoaded(listOfMovie));
    searchList = listOfMovie.first.results;

    final suggestion = searchList.where((element) {
      final apartmentNumber = element.title.toLowerCase();
      final input = query.toLowerCase();

      return apartmentNumber.contains(input);
    }).toList();

    emit(UpcomingMoviesSearchLoaded(
      suggestion,
    ));
  }
}
