import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_input.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text("Add Address"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 36.h),
            AppInput(radius: 10, label: "Titel"),
            AppInput(radius: 10, label: "Address"),
            AppInput(radius: 10, label: "Building No"),
            AppInput(radius: 10, label: "Floor No"),
            AppInput(radius: 10, label: "Apartment No"),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: AppButton(
          onPressed: () {},
          text: "Save",
          height: 50.h,
          width: double.infinity,
          borderRadius: 10,
        ),
      ),
    );
  }
}
