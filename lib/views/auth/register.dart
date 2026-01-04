import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_image.dart';
import 'package:suits/core/ui/app_input.dart';

import '../../core/ui/app_remember_check.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 30),
        ),
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            AppInput(label: "Enter your email", prefixImage: "person.png"),
            AppInput(label: "Enter your email", prefixImage: "email.png"),
            AppInput(
              isPassword: true,
              label: "Enter your password",
              prefixImage: "password.png",
            ),
            RememberMeCheckbox(),
            SizedBox(height: 40.h),
            AppButton(
              text: "Sign Up",
              borderRadius: 32.sp,
              height: 56.h,
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
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    " Sign In",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
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
