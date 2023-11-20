import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static var primaryColor = const Color(0XFF2E2739);
  static var secondaryColor = const Color(0XFF61C3F2);
  static var backgroundColor = const Color(0XFFF6F6FA);
  static var greenColor = const Color(0XFF12D2BC);
  static var pinkColor = const Color(0XFFE26CA5);
  static var darkBlueColor = const Color(0XFF564CA3);
  static var yellowColor = const Color(0XFFCC9D10);
  static var greyColor = const Color(0XFFDBDBDF);
  static var darkGreyColor = const Color(0XFF827D88);
}

class AppFontsFamily {
  static var poppinsBlack = "poppins_Black";
  static var poppinsBold = "poppins_Bold";
  static var poppinsLight = "poppins_Light";
  static var poppinsMedium = "poppins_Medium";
  static var poppinsRegular = "poppins_Regular";
  static var poppinsSemiBold = "poppins_SemiBold";
}

class AppTextStyles {
  static var dialogueTitleTextStyle = TextStyle(
      fontSize: 18.sp,
      color: AppColors.secondaryColor,
      fontFamily: AppFontsFamily.poppinsRegular,
      fontWeight: FontWeight.w500);

  static var cinemaInfoTextStyle = TextStyle(
    color: Color(0xFF202C43),
    fontSize: 12.sp,
    fontFamily: AppFontsFamily.poppinsRegular,
    fontWeight: FontWeight.w500,
  );

  static var appbarSubTitle = TextStyle(
      fontSize: 14.sp,
      color: AppColors.secondaryColor,
      fontFamily: AppFontsFamily.poppinsRegular,
      fontWeight: FontWeight.w500);

  static var appBarTitleTextStyle = TextStyle(
    color: Color(0xFF202C43),
    fontSize: 20.sp,
    fontFamily: AppFontsFamily.poppinsRegular,
    fontWeight: FontWeight.w500,
  );

  static var overViewTextStyle = TextStyle(
    color: Color(0xFF8F8F8F),
    fontSize: 14.sp,
    fontFamily: AppFontsFamily.poppinsRegular,
    fontWeight: FontWeight.w500,
  );

  static var seatingTextStyle = TextStyle(
    color: Color(0xFF8F8F8F),
    fontSize: 14.sp,
    fontFamily: AppFontsFamily.poppinsRegular,
    fontWeight: FontWeight.w500,
  );

  static var movieTitleTextStyle = TextStyle(
      fontSize: 20.sp,
      color: Colors.white,
      fontFamily: AppFontsFamily.poppinsRegular,
      fontWeight: FontWeight.w500);

  static var dialogueContentTextStyle = TextStyle(
      fontSize: 16.sp,
      color: AppColors.darkGreyColor,
      fontFamily: AppFontsFamily.poppinsRegular,
      fontWeight: FontWeight.w400);

  static var dialogueYesButtonTextStyle = TextStyle(
      fontSize: 12.sp,
      color: AppColors.greenColor,
      fontFamily: AppFontsFamily.poppinsRegular,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w400);

  static var dialogueCloseButtonTextStyle = TextStyle(
      fontSize: 12.sp,
      color: Color(0xFFCF6868),
      overflow: TextOverflow.ellipsis,
      fontFamily: AppFontsFamily.poppinsRegular,
      fontWeight: FontWeight.w400);

  static var themeFilledSuccessButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.greenColor,
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
        side: BorderSide(
          color: AppColors.greenColor,
        ),
      ),
    ),
  );

  static var bottomNavBarTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 10.sp,
    fontFamily: AppFontsFamily.poppinsRegular,
    fontWeight: FontWeight.w400,
  );

  static var genresTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12.sp,
    fontFamily: AppFontsFamily.poppinsRegular,
    fontWeight: FontWeight.w400,
  );

  static var theatherRealeaseDateTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.sp,
    fontFamily: AppFontsFamily.poppinsRegular,
    fontWeight: FontWeight.w500,
  );

  static var themeFilledCloseButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      Color(0xFFCF6868),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
        side: BorderSide(
          color: Color(0xFFCF6868),
        ),
      ),
    ),
  );
}
