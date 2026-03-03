import 'package:flutter/material.dart';
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
  final bool withCountryCode, isPassword, isBig;
  final double? bottomSpace, radius;

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
    this.prefixIcon,
    this.prefixImage = "",
    this.radius = 24,
    this.controller,
    this.validator,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    final double effectiveRadius = widget.radius ?? 24;

    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              maxLines: widget.isBig ? 4 : 1,
              obscureText: widget.isPassword && isHidden,

              validator: widget.validator ??
                      (value) {
                    if (value == null || value.isEmpty) {
                      return widget.isPassword
                          ? "Please Put Your Password"
                          : "Please Put Your Data";
                    }
                    return null;
                  },

              onChanged: (value) {
                if (!widget.isPassword) {
                  if (widget.validator != null) {
                    isValid = widget.validator!(value) == null;
                  } else {
                    isValid = value.isNotEmpty;
                  }
                  setState(() {});
                }
              },


              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,

                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(effectiveRadius),
                  borderSide:
                  const BorderSide(color: Colors.grey),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(effectiveRadius),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),

                errorBorder: const OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.red, width: 2),
                ),

                focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.red, width: 2),
                ),

                labelText: widget.label,
                labelStyle:
                const TextStyle(color: Colors.black),
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
                    image: isHidden
                        ? "visibility_off.svg"
                        : "visibility.svg",
                  ),
                )
                    : isValid
                    ?  Icon(
                  Icons.check,
                  color:Theme.of(context).primaryColor ,
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
          ),
        ],
      ),
    );
  }
}