import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_image.dart';
import 'package:suits/core/ui/app_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      _Model(
        image:
            "https://static.vecteezy.com/system/resources/previews/022/613/027/large_2x/google-icon-logo-symbol-free-png.png",
        title: "Sign in with google",
      ),
      _Model(
        image:
            "https://media.licdn.com/dms/image/v2/D4D22AQFkRMtM-h3APQ/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1711605718829?e=2147483647&v=beta&t=bIbOeiU0IetdPgtWuEhk7V0pIOBiDAVnGGHqmaSlpr8",
        title: "Sign in with Apple",
      ),
      _Model(
        image:
            "https://i.pinimg.com/736x/7b/ed/39/7bed398644d61cae7c4dd853b558a1c9.jpg",
        title: "Sign in with Facebook",
      ),
    ];
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
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            Text(
              textAlign: TextAlign.center,
              "Hi Welcome back, you’ve been missed",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 40.h),
            AppInput(label: "Enter your email", prefixImage: "email.png"),
            AppInput(
              isPassword: true,
              label: "Enter your password",
              prefixImage: "password.png",
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                textAlign: TextAlign.end,
                "Forgot Password?",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 22.h),
            AppButton(
              text: "Sign In",
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
                          "Yeay! Welcome Back",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        Text(
                          "Once again you login successfully \ninto medidoc app",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                        SizedBox(height: 24.h),

                        SizedBox(
                          width: 180.w,
                          height: 56.h,
                          child: AppButton(
                            text: "Go to home",
                            borderRadius: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Row(
              children: [
                Expanded(
                  child: Divider(color: Colors.grey.shade400, thickness: 1),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Divider(color: Colors.grey.shade400, thickness: 1),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            ...List.generate(
              list.length,
              (index) => Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(12),
                width: double.infinity.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32.sp),
                ),
                child: Row(
                  children: [
                    AppImage(
                      image: list[index].image,
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(width: 50.w),
                    Text(
                      list[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Model {
  final String image, title;

  _Model({required this.image, required this.title});
}
