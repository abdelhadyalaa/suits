import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_input.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  int selectedTab = 0;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Forgot Your Password?",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
            ),
            SizedBox(height: 11.h),
            Text(
              "Enter your email or your phone number, we will send you confirmation code",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
            ),
            SizedBox(height: 25.h),

            Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    _buildTabItem("Email", 0),
                    _buildTabItem("Phone", 1),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),

            if (selectedTab == 0)
              const AppInput(
                label: "Email",
                hint: "example@mail.com",
                prefixImage: "orange_email.png",
              )
            else
              const AppInput(
                label: "Phone Number",
                keyboardType: TextInputType.phone,
                prefixImage: "call.png",
              ),

            SizedBox(height: 40.h),
            AppButton(text: "Reset Password", borderRadius: 32),
          ],
        ),
      ),
    );
  }

  Expanded _buildTabItem(String title, int index) {
    bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
