import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedSeriesItems extends StatelessWidget {
  const FeaturedSeriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(viewportFraction: 0.6);

    return SizedBox(
      height: 302.h,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 0;

              if (pageController.hasClients &&
                  pageController.position.haveDimensions) {
                value = pageController.page! - index;
              } else {
                value = pageController.initialPage - index.toDouble();
              }

              value = value.clamp(-1, 1);

              final double verticalOffset = value.abs() * 22.h;

              final double rotation = value * -0.1;
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, verticalOffset)
                  ..rotateZ(rotation),
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(27.r),
                  ),
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
