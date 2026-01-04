import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeCheckbox extends StatefulWidget {
  const RememberMeCheckbox({super.key});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: rememberMe,
            onChanged: (val) {
              setState(() {
                rememberMe = val ?? false;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            side: const BorderSide(color: Colors.grey, width: 1),
            activeColor: Colors.green,
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            children: [
              TextSpan(
                text: "I agree to the medidoc ",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: "Terms of Service\n ",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              TextSpan(
                text: "and ",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: " Privacy Policy",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
