import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_button.dart';

class CustomPolicyDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onAgree;

  const CustomPolicyDialog({
    super.key,
    required this.title,
    required this.content,
    this.onAgree,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Text(
            content,
            style: TextStyle(fontSize: 14.sp, height: 1.5),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120.w,
              height: 45.h,
              child: AppButton(
                text: "Agree",
                onPressed: () {
                  if (onAgree != null) onAgree!();
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(width: 10.w),
            SizedBox(
              width: 120.w,
              height: 45.h,
              child: AppButton(
                text: "Close",
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const String privacyPolicyText = """
This Privacy Policy describes how Medidoc collects, uses, and protects your personal information. We respect your privacy and are committed to protecting your data while providing you a seamless experience on our app. By using Medidoc, you agree to the practices described in this policy.
""";

const String termsOfServiceText = """
These Terms of Service govern your use of the Medidoc app. By using our services, you agree to comply with all rules, regulations, and policies set forth here. You must be at least 18 years old to use this app and respect other users and content.
""";