import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_image.dart';

import '../../core/ui/app_button.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100.h,),
            AppImage(image: "checked.png"),
            SizedBox(height: 30.h,),
            Text("Payment Successful!",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold),),
            Text("Thank you for your purchase.",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: AppButton(
          onPressed: () {
            setState(() {});
          },
          text: "View Order",
          height: 50.h,
          width: double.infinity,
          borderRadius: 10,
        ),
      ),

    );
  }
}
