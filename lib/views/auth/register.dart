import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_input.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/privacy_policy.dart';
import 'login.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool acceptTerms = false;

  @override
  void dispose() {
    nameController.dispose();
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
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40.h),
              AppInput(
                controller: nameController,
                label: "Enter your name",
                prefixImage: "person.png",
                validator: (value) {
                  if (value == null || value.isEmpty) return "Name is required";
                  if (value.length > 50) return "Name cannot exceed 50 characters";
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w, top: 4.h),
                child: Text(
                  "${nameController.text.length}/50",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ),
              AppInput(
                controller: emailController,
                label: "Enter your email",
                prefixImage: "email.png",
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email is required";
                  if (!value.contains("@")) return "Invalid email format";
                  return null;
                },
              ),
              AppInput(
                controller: passwordController,
                isPassword: true,
                label: "Enter your password",
                prefixImage: "password.png",
                validator: (value) {
                  if (value == null || value.isEmpty) return "Password is required";
                  if (value.length < 8) return "Must be at least 8 characters";
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: acceptTerms,
                    onChanged: (val) {
                      setState(() {
                        acceptTerms = val ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text.rich(
                        TextSpan(
                          text: 'I agree to the medidoc ',
                          style: TextStyle(fontSize: 14.sp, color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomPolicyDialog(
                                      title: "Terms of Service",
                                      content: termsOfServiceText,
                                      onAgree: () {
                                        setState(() {
                                          acceptTerms = true;
                                        });
                                      },
                                    ),
                                  );
                                },
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(fontSize: 14.sp, color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomPolicyDialog(
                                      title: "Privacy Policy",
                                      content: privacyPolicyText,
                                      onAgree: () {
                                        setState(() {
                                          acceptTerms = true;
                                        });
                                      },
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              AppButton(
                text: "Sign Up",
                borderRadius: 32.sp,
                height: 56.h,
                onPressed: acceptTerms
                    ? () {
                  if (_formKey.currentState!.validate()) {
                    _showSuccessDialog(context);
                  }
                }
                    : null,
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () => goTo(page: const LoginView(), canPop: false),
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