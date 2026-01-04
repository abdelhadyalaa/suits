import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerifyCode extends StatelessWidget {
  const AppVerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        keyboardType: TextInputType.number,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Put Your Code';
          }
          return null;
        },
        appContext: context,
        cursorHeight: 16.h,
        cursorWidth: 5.w,

        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursorColor: Color(0x10101038).withValues(alpha: .22),
        length: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 64.h,
          fieldWidth: 64.w,
          borderRadius: BorderRadius.circular(8.r),

          selectedColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey.withValues(alpha: .11),
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          activeColor: Theme.of(context).primaryColor,
          selectedFillColor: Colors.white,
          borderWidth: 1,
          shape: PinCodeFieldShape.box,
        ),
      ),
    );
  }
}
