import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_image.dart';
import 'package:suits/core/ui/app_input.dart';

import '../../core/ui/app_button.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Add Card"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center(
              child: AppImage(
                image:
                    "https://avatars.mds.yandex.net/i?id=9d06960b8dee97d54338cfb243ae6ca0c4ba8870-5547280-images-thumbs&n=13",
                width: double.infinity,
                height: 200.h,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "Card Holder Name",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
            ),
            SizedBox(height: 6.h),
            const AppInput(radius: 10, hint: "John Doe"),
            SizedBox(height: 15.h),
            Text(
              "Card Number",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
            ),
            SizedBox(height: 6.h),
            const AppInput(
              radius: 10,
              hint: "2143  2341  1243  2143",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiry Date",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      const AppInput(
                        radius: 10,
                        hint: "mm/yy",
                        keyboardType: TextInputType.datetime,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CVV",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      const AppInput(
                        radius: 10,
                        hint: "●●●",
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: Checkbox(
                    value: isSaved,
                    activeColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    onChanged: (value) {
                      setState(() {
                        isSaved = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  "Save Card",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: AppButton(
          onPressed: () {
            setState(() {});
          },
          text: "Add Card",
          height: 50.h,
          width: double.infinity,
          borderRadius: 10,
        ),
      ),
    );
  }
}
