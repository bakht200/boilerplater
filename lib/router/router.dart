// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:boilerplater_movie_project/views/dashboard/home_screen.dart';
import 'package:boilerplater_movie_project/views/navigation/navigation_bar.dart';

class AppRoutes {
  static const SPLASH = '/';
  static const HOMESCREEN = '/homeScreen';
  static const NAVIGATIONBAR = '/navigationBar';
  static const MOVIEDETAIL = '/movieDetail';
  static const VIDEOPLAYER = '/videoPlayer';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      HOMESCREEN: (context) => const HomeScreen(),
      NAVIGATIONBAR: (context) => NavigationBarScreen(
            index: 0,
          ),
    };

    return appRoutes;
  }
}
