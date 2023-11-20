import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:tentwenty_movie_project/bloc_provider/bloc_provider.dart';
import 'package:tentwenty_movie_project/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: Size(width, height),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: OneContext().key,
              builder: OneContext().builder,
              routes: AppRoutes.getAppRoutes(),
              initialRoute: AppRoutes.HOMESCREEN,
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
