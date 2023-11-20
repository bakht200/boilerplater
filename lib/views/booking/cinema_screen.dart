import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:tentwenty_movie_project/constant/app_assets.dart';
import 'package:tentwenty_movie_project/constant/app_theme.dart';
import 'package:tentwenty_movie_project/router/router.dart';

class CinemaScreen extends StatefulWidget {
  const CinemaScreen({Key? key}) : super(key: key);

  @override
  State<CinemaScreen> createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 12.w, right: 12.w),
        child: GestureDetector(
          onTap: () {
            OneContext().pushNamed(AppRoutes.BOOKSEAT);
          },
          child: Container(
            height: 60.h,
            decoration: ShapeDecoration(
              color: Color(0xFF61C3F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Selected seats',
                style: AppTextStyles.theatherRealeaseDateTextStyle,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 70.h,
              child: ListTile(
                leading: GestureDetector(
                  onTap: () {
                    OneContext().pop();
                  },
                  child: Icon(
                    Icons.navigate_before,
                    color: AppColors.primaryColor,
                    size: 30.sp,
                  ),
                ),
                title: Text(
                  'The King’s Man',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.appBarTitleTextStyle,
                ),
                subtitle: Text(
                  'March 5,21 | 12:30 Hall 1',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.appbarSubTitle,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Date',
                      style: TextStyle(
                        color: Color(0xFF202C43),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 50.h,
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: ShapeDecoration(
                                  color: Color(0xFF61C3F2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 21,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    '5 Mar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 240.h,
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('12:30',
                                          style: AppTextStyles
                                              .cinemaInfoTextStyle),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text('Cinetech + hall 1',
                                          style: AppTextStyles
                                              .cinemaInfoTextStyle),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    width: 249.w,
                                    height: 145.h,
                                    padding: EdgeInsets.all(10.w),
                                    decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF61C3F2)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 1),
                                            spreadRadius: 0,
                                          )
                                        ]),
                                    child: Center(
                                      child: Image.asset(seatsImages),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'From',
                                            style: AppTextStyles
                                                .cinemaInfoTextStyle),
                                        TextSpan(
                                            text: ' ',
                                            style: AppTextStyles
                                                .cinemaInfoTextStyle),
                                        TextSpan(
                                            text: '50\$ ',
                                            style: AppTextStyles
                                                .cinemaInfoTextStyle),
                                        TextSpan(
                                          text: 'or',
                                          style: TextStyle(
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                            text: ' ',
                                            style: AppTextStyles
                                                .cinemaInfoTextStyle),
                                        TextSpan(
                                            text: '2500 bonus',
                                            style: AppTextStyles
                                                .cinemaInfoTextStyle),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
