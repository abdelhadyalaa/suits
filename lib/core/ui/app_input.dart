import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';

class AppInput extends StatefulWidget {
  final String? suffixIcon;
  final TextInputType keyboardType;
  final Color? vColor;
  final String hint, label;
  final bool withCountryCode, isPassword, isBig;
  final double? bottomSpace;

  const AppInput({
    super.key,
    this.suffixIcon,
    this.hint = "",
    this.label = "",
    this.withCountryCode = false,
    this.isPassword = false,
    this.bottomSpace,
    this.vColor,
    this.isBig = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: widget.keyboardType,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return widget.isPassword
                      ? "Please Put Your Password"
                      : 'Please Put Your Data';
                }
                return null;
              },
              maxLines: widget.isBig ? 4 : 1,
              obscureText: widget.isPassword && isHidden,
              decoration: InputDecoration(
                filled: true,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),

                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                labelText: widget.label,
                labelStyle: TextStyle(color: Colors.black),
                hintText: widget.hint,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          isHidden = !isHidden;
                          setState(() {});
                        },
                        icon: AppImage(
                          image: isHidden
                              ? "visibility_off.svg"
                              : "visibility.svg",
                        ),
                      )
                    : widget.suffixIcon != null
                    ? AppImage(image: widget.suffixIcon!, height: 18, width: 18)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
