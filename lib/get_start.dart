import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/views/auth/login.dart';
import '../core/ui/app_button.dart';
import '../core/ui/app_image.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 34.h,),
              Row(
                children: [
                  Container(
                    width: 137.w,
                    // height: 370,
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
                child: AppButton(
                  text: "Get started",
                  onPressed: () {
                    goTo(page: LoginView());
                  },
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
