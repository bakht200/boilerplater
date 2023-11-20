// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tentwenty_movie_project/views/booking/book_seat_screen.dart';
import 'package:tentwenty_movie_project/views/booking/cinema_screen.dart';
import 'package:tentwenty_movie_project/views/dashboard/home_screen.dart';
import 'package:tentwenty_movie_project/views/movie_detail/movie_detail_screen.dart';
import 'package:tentwenty_movie_project/views/navigation/navigation_bar.dart';

class AppRoutes {
  static const SPLASH = '/';
  static const HOMESCREEN = '/homeScreen';
  static const NAVIGATIONBAR = '/navigationBar';
  static const MOVIEDETAIL = '/movieDetail';
  static const VIDEOPLAYER = '/videoPlayer';
  static const BOOKSEAT = "/bookSeat";
  static const CINEMASCREEN = "/cinemaScreen";

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      HOMESCREEN: (context) => const HomeScreen(),
      NAVIGATIONBAR: (context) => NavigationBarScreen(
            index: 0,
          ),
      MOVIEDETAIL: (context) => const MovieDetailScreen(),
      BOOKSEAT: (context) => BookSeatScreen(),
      CINEMASCREEN: (context) => CinemaScreen(),
    };

    return appRoutes;
  }
}
