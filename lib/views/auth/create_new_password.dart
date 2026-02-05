import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_input.dart';
import '../../core/ui/app_image.dart';
import '../auth/login.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create New Password",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
              ),
              SizedBox(height: 8.h),
              const Text(
                "Create your new password to login",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              SizedBox(height: 24.h),
              AppInput(
                controller: passwordController,
                isPassword: true,
                label: "Enter your password",
                prefixImage: "password.png",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) return "Must be at least 6 characters";
                  return null;
                },
              ),
              AppInput(
                controller: confirmPasswordController,
                isPassword: true,
                label: "Confirm your password",
                prefixImage: "password.png",
                validator: (value) {
                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              AppButton(
                text: "Create Password",
                borderRadius: 32,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showSuccessDialog(context);
                  }
                },
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
      barrierDismissible: false,
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
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Your password has been successfully \nreset",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: 180.w,
              height: 56.h,
              child: AppButton(
                text: "Sign In",
                borderRadius: 32,
                onPressed: () {
                  Navigator.pop(context);
                  goTo(page: const LoginView(), canPop: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
