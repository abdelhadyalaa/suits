import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_input.dart';

import '../../core/ui/app_image.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 30),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Create New Password",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            SizedBox(height: 8.h),
            Text(
              "Create your new password to login",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            SizedBox(height: 24.h),

            AppInput(
              isPassword: true,
              label: "Enter your password",
              prefixImage: "password.png",
            ),

            AppInput(
              isPassword: true,
              label: "Enter your password",
              prefixImage: "password.png",
            ),
            SizedBox(height: 20.h),
            AppButton(
              text: "Create Password",
              borderRadius: 32,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F8FF),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: AppImage(
                              image: "correct.png",
                              width: 40.w,
                              height: 30.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),

                        Text(
                          "Success",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Your account has been successfully \nregistered",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 24.h),

                        SizedBox(
                          width: 180.w,
                          height: 56.h,
                          child: AppButton(text: "Sign In", borderRadius: 32),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
