import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/views/auth/login.dart';
import '../core/ui/app_button.dart';
import '../core/ui/app_image.dart';
import 'get_start.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final list = [
    _Model(
      image: "boarding1.jpg",
      title: "Welcome To\n Fashion",
      desc:
          "Discover the latest trends and exclusive styles\nfrom our top designers",
    ),
    _Model(
      image: "boarding2.jpg",
      title: "Explore & Shop",
      desc:
          "Discover a wide range of fashion categories,\nbrowse new arrivals and shop your favourites",
    ),
    _Model(image: "boarding3.png", title: "Hi,Shop Now", desc: ""),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLast = currentIndex == list.length-1;
    bool isFirst = currentIndex == 0;
    final currentModel = list[currentIndex];

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AppImage(
              image: currentModel.image,
              width: double.infinity.w,
              height: double.infinity.h,
              fit: BoxFit.fill,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (!isLast)
                    GestureDetector(
                      onTap: () {
                        goTo(page: const FinalPage(), canPop: false);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 24,
                        ),
                        width: 80.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(child: Text("Skip")),
                      ),
                    ),
                  Spacer(),
                  Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          currentModel.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                          currentModel.desc,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (!isFirst)
                              GestureDetector(
                                onTap: () {
                                  if (currentIndex > 0) currentIndex--;
                                  setState(() {});
                                },
                                child: Transform.rotate(
                                  angle: 180 * 3.14 / 180,
                                  child: Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(24.r),
                                    ),
                                    child: AppImage(
                                      image: "forward_stroke.svg",
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              )
                            else
                              SizedBox(width: 50.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                list.length,
                                (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  height: 10.h,

                                  width: currentIndex == index ? 20.w : 10.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),

                                    color: currentIndex == index
                                        ? Theme.of(context).primaryColor
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (isLast) {
                                  goTo(page: const FinalPage(), canPop: false);
                                } else {
                                  setState(() {
                                    currentIndex++;
                                  });
                                }
                              },
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.r),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: AppImage(
                                  image: "forward_stroke.svg",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Model {
  final String image, title, desc;

  _Model({required this.image, required this.title, required this.desc});
}
