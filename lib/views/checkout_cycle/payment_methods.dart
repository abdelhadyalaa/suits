import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_image.dart';

import '../../core/ui/app_button.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        ),
        title: Text("Payment Methods"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 22.h),
            Text(
              "Credit & Debit Card",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            SizedBox(height: 26.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  AppImage(image: "credit_card.png", width: 30.w, height: 30.h),
                  SizedBox(width: 10.w),
                  Text(
                    "Add Card",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.h),
            Text("More Payment Options",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),

            ),
            SizedBox(height: 26.h),
            CustomProductRadioPicker(),
            Spacer(),
            AppButton(text: 'Confirm Payment',height: 45.h,width: double.infinity,borderRadius: 10,)
          ],
        ),
      ),
    );
  }
}

class CustomProductRadioPicker extends StatefulWidget {
  const CustomProductRadioPicker({super.key});

  @override
  State<CustomProductRadioPicker> createState() =>
      _CustomProductRadioPickerState();
}

class _CustomProductRadioPickerState extends State<CustomProductRadioPicker> {
  String? selectedValue = "option1";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildRadioItem(
            id: "option1",
            title: "Paypal",
            image: "https://logos-marcas.com/wp-content/uploads/2020/04/PayPal-s%C3%ADmbolo.png",
          ),

          Divider(
            height: 1,
            indent: 20.w,
            endIndent: 20.w,
            color: Colors.grey.shade200,
          ),

          _buildRadioItem(
            id: "option2",
            title: "Apple Pay",
            image: "https://avatars.mds.yandex.net/i?id=a7a70d51b67c554ad000f3ff2349ed8a1bbfbb71-2366455-images-thumbs&n=13",
          ),

          Divider(
            height: 1,
            indent: 20.w,
            endIndent: 20.w,
            color: Colors.grey.shade200,
          ),

          _buildRadioItem(
            id: "option3",
            title: "Google",
            image: "https://avatars.mds.yandex.net/i?id=20133f4c9223e969edc3decc936722b3fd1aeafc-10157623-images-thumbs&n=13",
          ),
        ],
      ),
    );
  }

  Widget _buildRadioItem({
    required String id,
    required String title,
    required String image,
  }) {
    bool isSelected = selectedValue == id;

    return InkWell(
      onTap: () {
        setState(() {
          selectedValue = id;
        });
      },
      borderRadius: BorderRadius.circular(15.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            // 1. الصورة
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: AppImage(
                image: image,
                width: 30.w,
                height: 30.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15.w),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                ),
              ),
            ),

            Radio<String>(
              value: id,
              groupValue: selectedValue,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
