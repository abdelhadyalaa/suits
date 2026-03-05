import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_input.dart';
import 'otp.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  int selectedTab = 0;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
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
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
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
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Row(
                  children: [
                    _buildTabItem("Email", 0),
                    _buildTabItem("Phone", 1),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              if (selectedTab == 0)
                AppInput(
                  controller: emailController,
                  label: "Email",
                  hint: "example@mail.com",
                  prefixImage: "orange_email.png",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (selectedTab != 0) return null;
                    if (value == null || value.isEmpty) return "Email is required";
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
                    if (!emailRegex.hasMatch(value)) return "Invalid email format";
                    return null;
                  },
                )
              else
                AppInput(
                  controller: phoneController,
                  label: "Phone Number",
                  hint: "01xxxxxxxxx",
                  keyboardType: TextInputType.phone,
                  prefixImage: "call.png",
                  validator: (value) {
                    if (selectedTab != 1) return null;
                    if (value == null || value.isEmpty) return "Phone number is required";
                    if (value.length != 11) return "Invalid phone number";
                    return null;
                  },
                ),
              SizedBox(height: 40.h),
              AppButton(
                text: "Reset Password",
                borderRadius: 32,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String destination =
                    selectedTab == 0 ? emailController.text : phoneController.text;
                    goTo(page: OTPView(phoneNumber: destination));
                  } else {
                    if (selectedTab == 0 && (emailController.text.isEmpty)) {
                      showMsg("Email is required");
                    } else if (selectedTab == 1 && (phoneController.text.isEmpty)) {
                      showMsg("Phone number is required");
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildTabItem(String title, int index) {
    bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _formKey.currentState?.reset();
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ]
                : [],
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}