import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? suffixIcon;
  final String? prefixIcon;
  final TextInputType keyboardType;
  final Color? vColor;
  final String hint, label, prefixImage;
  final bool withCountryCode, isPassword, isBig, isEmail;
  final double? bottomSpace, radius;
  final List<TextInputFormatter>? inputFormatters;

  const AppInput({
    super.key,
    this.suffixIcon,
    this.hint = "",
    this.label = "",
    this.withCountryCode = false,
    this.isPassword = false,
    this.isEmail = false,
    this.bottomSpace,
    this.vColor,
    this.isBig = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.prefixImage = "",
    this.radius = 24,
    this.controller,
    this.validator,
    this.inputFormatters,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;
  bool isValid = false;
  String? passwordMessage;

  bool _isPasswordWeak(String value) {
    if (value.length < 8) {
      passwordMessage = "Password must be at least 8 characters";
      return true;
    }
    final hasUpper = RegExp(r'[A-Z]').hasMatch(value);
    final hasLower = RegExp(r'[a-z]').hasMatch(value);
    final hasDigit = RegExp(r'\d').hasMatch(value);
    if (!hasUpper || !hasLower || !hasDigit) {
      passwordMessage = "Password must contain upper, lower & number";
      return true;
    }
    const sequential = ["1234", "2345", "3456", "4567", "5678", "6789", "0123", "abcd", "bcde"];
    for (var seq in sequential) {
      if (value.contains(seq)) {
        passwordMessage = "Password should not be sequential";
        return true;
      }
    }
    passwordMessage = null;
    return false;
  }

  bool _isEmailValid(String value) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final double effectiveRadius = widget.radius ?? 24;

    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            maxLines: widget.isBig ? 4 : 1,
            obscureText: widget.isPassword && isHidden,
            inputFormatters: widget.isEmail
                ? [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-]')),
            ]
                : widget.inputFormatters,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.isPassword
                    ? "Please enter your password"
                    : "This field is required";
              }
              if (widget.isPassword && _isPasswordWeak(value)) {
                return passwordMessage;
              }
              if (widget.isEmail && !_isEmailValid(value)) {
                return "Invalid email format";
              }
              if (!widget.isPassword && !widget.isEmail && widget.validator != null) {
                return widget.validator!(value);
              }
              return null;
            },
            onChanged: (value) {
              if (widget.isPassword) {
                isValid = !_isPasswordWeak(value);
              } else if (widget.isEmail) {
                isValid = _isEmailValid(value);
              } else if (widget.validator != null) {
                isValid = widget.validator!(value) == null;
              } else {
                isValid = value.isNotEmpty;
              }
              setState(() {});
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(effectiveRadius),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(effectiveRadius),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              labelText: widget.label,
              labelStyle: const TextStyle(color: Colors.black),
              hintText: widget.hint,
              prefixIcon: widget.prefixImage.isNotEmpty
                  ? AppImage(
                image: widget.prefixImage,
                width: 20,
                height: 20,
              )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },
                icon: AppImage(
                  image: isHidden ? "visibility_off.svg" : "visibility.svg",
                ),
              )
                  : isValid
                  ? Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
              )
                  : widget.suffixIcon != null
                  ? AppImage(
                image: widget.suffixIcon!,
                height: 18,
                width: 18,
                color: Colors.black,
              )
                  : null,
            ),
          ),
          if (widget.isPassword && passwordMessage != null)
            Padding(
              padding: EdgeInsets.only(top: 4.h, left: 8.w),
              child: Text(
                passwordMessage!,
                style: TextStyle(color: Colors.red, fontSize: 12.sp),
              ),
            ),
        ],
      ),
    );
  }
}