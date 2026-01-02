import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/ui/app_button.dart';
import '../core/ui/app_image.dart';

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
    _Model(image: "", title: "", desc: ""),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLast = currentIndex == list.length - 1;
    bool isFirst = currentIndex == 0;
    final currentModel = list[currentIndex];
    // void goToLogin() {
    //   // goTo(page: LoginView());
    // }

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

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (!isLast)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = list.length - 1;
                      });
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 30,
                    ),
                    child: Column(
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
                        isLast
                            ? FinalPage()
                            : Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius: BorderRadius.circular(
                                                24.r,
                                              ),
                                            ),
                                            child: AppImage(
                                              image: "forward_stroke.svg",
                                              color: Theme.of(
                                                context,
                                              ).primaryColor,
                                            ),
                                          ),
                                        ),
                                      )
                                    else
                                      SizedBox(width: 50.w),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        list.length - 1,
                                        (index) => AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          height: 10.h,

                                          width: currentIndex == index
                                              ? 20.w
                                              : 10.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              4.r,
                                            ),

                                            color: currentIndex == index
                                                ? Theme.of(context).primaryColor
                                                : Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        currentIndex++;
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            24.r,
                                          ),
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
                  ),
                ),
              ],
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

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 137.w,
                  height: 370,
                  decoration: BoxDecoration(
                    color: Colors.green,

                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(child: AppImage(image: "boarding3.jpg")),
                ),
                SizedBox(width: 50.w),

                Column(
                  children: [
                    AppImage(image: "boarding4.png"),
                    SizedBox(height: 24.h),
                    ClipOval(
                      child: AppImage(
                        image: "boarding5.png",
                        width: 140,
                        height: 132,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "The",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: " Suits App",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: " that\n Makes Your Look Your Best",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              textAlign: TextAlign.center,
              "Everything you need in the world\n of fashion, old and new",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: Color(0xff727272),
              ),
            ),
            SizedBox(height: 60.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppButton(text: "Get started", onPressed: () {}),

            ),
            SizedBox(height: 50.h,)
          ],
        ),
      ),
    );
  }
}
