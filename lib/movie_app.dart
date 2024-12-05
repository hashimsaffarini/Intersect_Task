import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/core/routes/app_router.dart';
import 'package:intersect_task/features/home/ui/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoutes,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
