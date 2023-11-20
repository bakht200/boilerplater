import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:tentwenty_movie_project/constant/app_theme.dart';
import 'package:tentwenty_movie_project/views/dashboard/home_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  final int index;
  NavigationBarScreen({required this.index});
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  late PersistentTabController persistentTabController;
  late BuildContext buildContext;

  @override
  void initState() {
    persistentTabController =
        PersistentTabController(initialIndex: widget.index);
    _buildScreens();
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }

  Future<bool> _willPopCallback() async {
    if (persistentTabController.index == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Confirm Exit!",
              style: AppTextStyles.dialogueTitleTextStyle,
            ),
            content: Text(
              "Are you sure you want to exit?",
              style: AppTextStyles.dialogueContentTextStyle,
            ),
            actions: [
              TextButton(
                child: Text(
                  "Yes",
                  style: AppTextStyles.dialogueYesButtonTextStyle,
                ),
                style: AppTextStyles.themeFilledSuccessButtonStyle,
                onPressed: () {
                  exit(0);
                },
              ),
              TextButton(
                child: Text(
                  "No",
                  style: AppTextStyles.dialogueCloseButtonTextStyle,
                ),
                style: AppTextStyles.themeFilledCloseButtonStyle,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: PersistentTabView(
        context,
        padding: NavBarPadding.all(10),
        backgroundColor: AppColors.primaryColor,
        controller: persistentTabController,
        screens: _buildScreens(),
        navBarHeight: 70.h,
        items: [
          PersistentBottomNavBarItem(
              icon: Icon(Icons.dashboard),
              title: ('Dashboard'),
              activeColorPrimary: Colors.white,
              inactiveColorPrimary: AppColors.darkGreyColor,
              textStyle: AppTextStyles.bottomNavBarTextStyle),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.play_circle),
              title: ('Watch'),
              activeColorPrimary: Colors.white,
              inactiveColorPrimary: AppColors.darkGreyColor,
              textStyle: AppTextStyles.bottomNavBarTextStyle),
          PersistentBottomNavBarItem(
              icon: Icon(
                Icons.collections,
              ),
              title: ('Media Library'),
              activeColorPrimary: Colors.white,
              inactiveColorPrimary: AppColors.darkGreyColor,
              textStyle: AppTextStyles.bottomNavBarTextStyle),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.more_vert),
              title: ('More'),
              activeColorPrimary: Colors.white,
              inactiveColorPrimary: AppColors.darkGreyColor,
              textStyle: AppTextStyles.bottomNavBarTextStyle),
        ],
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(microseconds: 2),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(microseconds: 10),
        ),
        navBarStyle: NavBarStyle.simple,
      ),
    );
  }
}
