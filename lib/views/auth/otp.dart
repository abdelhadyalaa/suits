import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';

import '../../core/ui/app_image.dart';
import '../../core/ui/app_resend_otp.dart';
import '../../core/ui/app_verify_code.dart';

class OtpView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  final bool isFromCreateAccount;

  OtpView({super.key, this.isFromCreateAccount = false});

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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffA1A8B0),
                    ),
                    children: [
                      TextSpan(
                        text: "Enter code that we have sent to your\n number",
                      ),
                      TextSpan(
                        text: " 08528188***",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withValues(alpha: .88),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 34.h),

                AppVerifyCode(),
                SizedBox(height: 42.h),
                AppButton(text: "Verify", onPressed: () {}, borderRadius: 32),
                SizedBox(height: 24.h),

                AppResendOtp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
