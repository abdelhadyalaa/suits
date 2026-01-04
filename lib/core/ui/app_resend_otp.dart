import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResendOtp extends StatefulWidget {
  const AppResendOtp({super.key});

  @override
  State<AppResendOtp> createState() => _AppResendOtpState();
}

class _AppResendOtpState extends State<AppResendOtp> {
  bool isCodeSent = true;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isCodeSent) ...[
            CircularCountDownTimer(
              controller: _controller,
              width: 40.w,
              height: 40.h,
              duration: 30,
              fillColor: Theme.of(context).primaryColor,
              ringColor: Colors.grey[200]!,
              strokeWidth: 3.w,
              isReverse: true,
              isReverseAnimation: true,
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textFormat: CountdownTextFormat.MM_SS,
              onComplete: () {
                setState(() {
                  isCodeSent = false;
                });
              },
            ),
            SizedBox(width: 8.w),
          ],

          Text(
            "Didn’t receive the code?",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),

          SizedBox(width: 4.w),

          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: isCodeSent
                ? null
                : () {
              setState(() {
                isCodeSent = true;
              });
              _controller.restart(duration: 10);
            },
            child: Text(
              "Resend",
              style: TextStyle(
                color: isCodeSent ? Colors.grey : Theme.of(context).primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}