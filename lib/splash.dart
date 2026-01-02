import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_image.dart';
import 'core/logic/helper_methods.dart';
import 'on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color color = Color(0xffDD8560);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          color = Color(0xff676767);
        });
      }
    });

    Timer(Duration(seconds: 6), () {
      if (mounted) {
        goTo(page: OnBoarding());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: FadeIn(
          duration: Duration(seconds: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BackInLeft(
                        duration: Duration(seconds: 3),
                        child: AppImage(
                          image: "splash.png",
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      BackInRight(
                        duration: Duration(seconds: 3),

                        child: AppImage(
                          image: "suits.png",
                          width: 136.w,
                          height: 192.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
