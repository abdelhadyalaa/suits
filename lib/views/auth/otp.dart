import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/views/auth/create_new_password.dart';
import '../../core/ui/app_resend_otp.dart';
import '../../core/ui/app_verify_code.dart';

class OTPView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final bool isFromCreateAccount;
  final String? phoneNumber;

  OTPView({
    super.key,
    this.isFromCreateAccount = false,
    this.phoneNumber = " 08528188***",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 30),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(18.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24.h),
                Text(
                  "Enter Verification Code",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 8.h),
                Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffA1A8B0),
                    ),
                    children: [
                      const TextSpan(
                        text: "Enter code that we have sent to your\n number",
                      ),
                      TextSpan(
                        text: phoneNumber,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.88),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 34.h),
                const AppVerifyCode(),
                SizedBox(height: 42.h),
                AppButton(
                  text: "Verify",
                  borderRadius: 32,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      goTo(page: CreateNewPassword());
                    }
                  },
                ),
                SizedBox(height: 24.h),
                const AppResendOtp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
