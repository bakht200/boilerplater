import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:boilerplater_movie_project/arguments/movie_detail_arguments.dart';
import 'package:boilerplater_movie_project/constant/app_assets.dart';
import 'package:boilerplater_movie_project/constant/app_theme.dart';
import 'package:boilerplater_movie_project/constant/config.dart';
import 'package:boilerplater_movie_project/controller/upcoming_movie_cubit/upcoming_movies_cubit.dart';
import 'package:boilerplater_movie_project/router/router.dart';
import 'package:boilerplater_movie_project/router/tab_navigator.dart';
import 'package:boilerplater_movie_project/views/movie_category/movies_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                TabNavigator.withoutTabNavigator(
                    context: context,
                    screen: MoviesCategoryScreen(),
                    withNavBar: true);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            )
          ],
          title: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Watch', style: AppTextStyles.appBarTitleTextStyle),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Expanded(
                child: BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
              builder: (context, state) {
                if (state is UpcomingMoviesLoaded) {
                  return ListView.builder(
                      itemCount: state.upcomingMovieList.first.results.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            OneContext().pushNamed(AppRoutes.MOVIEDETAIL,
                                arguments: MovieDetailArguments(
                                  movieId: state
                                      .upcomingMovieList.first.results[index].id
                                      .toString(),
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Stack(children: <Widget>[
                              Container(
                                height: 180.h,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${Config.imagesUrl}${state.upcomingMovieList.first.results[index].backdropPath}"),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 150.h,
                                left: 20.w,
                                child: Text(
                                    "${state.upcomingMovieList.first.results[index].title}",
                                    style: AppTextStyles.movieTitleTextStyle),
                              ),
                            ]),
                          ),
                        );
                      }));
                } else if (state is UpcomingMoviesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is UpcomingMoviesFailed) {
                  return Center(child: Text(ErrorMessage.failedToLoadData));
                } else if (state is UpcomingMoviesInternetError) {
                  return Center(child: Text(ErrorMessage.internetConnection));
                } else if (state is UpcomingMoviesTimeout) {
                  return Center(child: Text(ErrorMessage.requestTimeOut));
                } else {
                  return SizedBox();
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
