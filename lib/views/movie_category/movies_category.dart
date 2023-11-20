import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty_movie_project/constant/app_assets.dart';
import 'package:tentwenty_movie_project/constant/app_theme.dart';
import 'package:tentwenty_movie_project/constant/config.dart';

import 'package:tentwenty_movie_project/controller/movie_category_cubits/movie_category_cubit.dart';
import 'package:tentwenty_movie_project/controller/movie_category_cubits/searchbar_cubit/search_bar_cubit.dart';
import 'package:tentwenty_movie_project/controller/upcoming_movie_cubit/upcoming_movies_cubit.dart';

class MoviesCategoryScreen extends StatefulWidget {
  const MoviesCategoryScreen({Key? key}) : super(key: key);

  @override
  State<MoviesCategoryScreen> createState() => _MoviesCategoryScreenState();
}

class _MoviesCategoryScreenState extends State<MoviesCategoryScreen> {
  late MovieCategoryCubit movieCategoryCubit;
  late SearchBarCubit searchBarCubit;

  initCubit() {
    movieCategoryCubit = context.read<MovieCategoryCubit>();
    movieCategoryCubit.getMovieCategoryList();
    searchBarCubit = context.read<SearchBarCubit>();
    searchBarCubit.updateSearchBarStatus(true);
  }

  @override
  void initState() {
    initCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 8.w),
            child: Container(
                height: 50.h,
                child: TextField(
                  onChanged: ((value) {
                    if (value.length <= 0) {
                      searchBarCubit.updateSearchBarStatus(true);
                    } else {
                      searchBarCubit.updateSearchBarStatus(false);
                      context
                          .read<UpcomingMoviesCubit>()
                          .searchMovieTitle(value);
                    }
                  }),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: AppColors.backgroundColor,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          context
                              .read<UpcomingMoviesCubit>()
                              .getUpComingMovieList();
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: new TextStyle(color: Colors.black38),
                      hintText: "TV shows, movies and more"),
                )),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<SearchBarCubit, SearchBarState>(
                builder: (context, state) {
                  if (state is SearchBarOpended) {
                    return BlocBuilder<MovieCategoryCubit, MovieCategoryState>(
                      builder: (context, state) {
                        if (state is MovieCategoryLoaded) {
                          return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0),
                              itemCount:
                                  state.movieCategoryList.first.genres.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Stack(children: <Widget>[
                                    Container(
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              movieCategoryImageList[index]),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
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
                                      top: 80.h,
                                      left: 20.w,
                                      child: Text(
                                          state.movieCategoryList.first
                                              .genres[index].name
                                              .toString(),
                                          style: AppTextStyles
                                              .movieTitleTextStyle),
                                    ),
                                  ]),
                                );
                              });
                        } else if (state is MovieCategoryLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is MovieCategoryFailed) {
                          return Center(
                              child: Text(ErrorMessage.failedToLoadData));
                        } else if (state is MovieCategoryInternetError) {
                          return Center(
                              child: Text(ErrorMessage.internetConnection));
                        } else if (state is MovieCategoryTimeout) {
                          return Center(
                              child: Text(ErrorMessage.requestTimeOut));
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  } else {
                    return BlocBuilder<UpcomingMoviesCubit,
                        UpcomingMoviesState>(
                      builder: (context, state) {
                        if (state is UpcomingMoviesSearchLoaded) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.upcomingMovieList.length,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 130.w,
                                          height: 100.h,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "${Config.imagesUrl}${state.upcomingMovieList[index].backdropPath}"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                              state.upcomingMovieList[index]
                                                  .title
                                                  .toString(),
                                              maxLines: 2,
                                              style: AppTextStyles
                                                  .cinemaInfoTextStyle,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: AppColors.secondaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        } else if (state is UpcomingMoviesLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is UpcomingMoviesFailed) {
                          return Center(
                              child: Text(ErrorMessage.failedToLoadData));
                        } else if (state is UpcomingMoviesInternetError) {
                          return Center(
                              child: Text(ErrorMessage.internetConnection));
                        } else if (state is UpcomingMoviesTimeout) {
                          return Center(
                              child: Text(ErrorMessage.requestTimeOut));
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
