import 'package:flutter/material.dart';
import 'package:intersect_task/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenBody(),
    );
  }
}
