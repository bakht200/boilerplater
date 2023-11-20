import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:boilerplater_movie_project/arguments/movie_detail_arguments.dart';
import 'package:boilerplater_movie_project/constant/app_theme.dart';
import 'package:boilerplater_movie_project/controller/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:boilerplater_movie_project/model/movie_detail_model.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    MovieDetailArguments argumentData =
        ModalRoute.of(context)!.settings.arguments as MovieDetailArguments;

    return BlocProvider(
      create: (_) => MovieDetailCubit()..getMovieDetail(argumentData.movieId),
      child: Scaffold(body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return Center(
              child: Platform.isAndroid
                  ? CircularProgressIndicator()
                  : CupertinoActivityIndicator(),
            );
          } else if (state is MovieDetailLoaded) {
            MovieDetail movieDetail = state.movieDetail;
            return SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    child: ClipRRect(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/${movieDetail.backdropPath}',
                        height: MediaQuery.of(context).size.height / 2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: GestureDetector(
                          onTap: () {
                            OneContext().pop();
                          },
                          child: Icon(
                            Icons.navigate_before,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ),
                        title: Text('Watch',
                            style: AppTextStyles.movieTitleTextStyle),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 120.h),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Container(
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
                                child: Text(
                                  movieDetail.title!,
                                  style: AppTextStyles.movieTitleTextStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text('In theaters ${movieDetail.releaseDate}',
                                  style: AppTextStyles
                                      .theatherRealeaseDateTextStyle),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 243.w,
                                  height: 50.h,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF61C3F2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text('Get Tickets',
                                        style: AppTextStyles
                                            .theatherRealeaseDateTextStyle),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 243.w,
                                  height: 50.h,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFF61C3F2)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      Text('Watch Trailer',
                                          style: AppTextStyles
                                              .theatherRealeaseDateTextStyle)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Container(
                                child: Text('Genres',
                                    style:
                                        AppTextStyles.dialogueContentTextStyle),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              height: 30.h,
                              child: ListView.builder(
                                  itemCount: movieDetail.genres!.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 4.w, right: 4.w),
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          color: index % 2 == 0
                                              ? AppColors.pinkColor
                                              : AppColors.greenColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.w),
                                          child: Text(
                                              movieDetail.genres![index].name
                                                  .toString(),
                                              style: AppTextStyles
                                                  .genresTextStyle),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Divider(),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Text('Overview',
                                  style:
                                      AppTextStyles.dialogueContentTextStyle),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Container(
                                height: 0.25.sh,
                                width: 1.sw,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    movieDetail.overview.toString(),
                                    style: AppTextStyles.overViewTextStyle,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      )),
    );
  }
}
