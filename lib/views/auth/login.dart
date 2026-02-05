import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_image.dart';
import 'package:suits/core/ui/app_input.dart';
import 'package:suits/views/auth/forget_password.dart';
import 'package:suits/views/auth/register.dart';
import '../home/view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 30),
        ),
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              const Text(
                "Hi Welcome back, you’ve been missed",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40.h),
              AppInput(
                controller: emailController,
                label: "Enter your email",
                prefixImage: "email.png",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!value.contains('@')) return "Invalid Email";
                  return null;
                },
              ),
              AppInput(
                controller: passwordController,
                isPassword: true,
                label: "Enter your password",
                prefixImage: "password.png",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) return "Password too short";
                  return null;
                },
              ),
              GestureDetector(
                onTap: () => goTo(page: const ForgetPassword()),
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.end,
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
                  if (_formKey.currentState!.validate()) {
                    _showSuccessDialog(context);
                  }
                },
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () => goTo(page: const RegisterView()),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
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
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32.sp),
                    border: Border.all(color: Colors.grey.shade200),
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
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
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
                onPressed: () {
                  Navigator.pop(context);
                  goTo(page: const HomeView(), canPop: false);
                },
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
