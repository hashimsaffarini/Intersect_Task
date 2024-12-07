import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/core/di/dependency_injection.dart';
import 'package:intersect_task/movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  setUpGetIt();

  await ScreenUtil.ensureScreenSize();
  runApp(const MovieApp());
}
