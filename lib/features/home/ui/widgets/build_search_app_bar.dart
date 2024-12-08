import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/features/home/logic/home_cubit.dart';

AppBar buildSearchAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
        size: 24.w,
      ),
      onPressed: () {
        context.read<HomeCubit>().reFetchMovies();
        Navigator.pop(context);
      },
    ),
  );
}
