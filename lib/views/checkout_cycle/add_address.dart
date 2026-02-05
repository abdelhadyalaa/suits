import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_input.dart';
import 'package:suits/views/checkout_cycle/shoping_address.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Add Address"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 36.h),
              AppInput(
                radius: 10,
                label: "Title",
                validator: (value) {
                  if (value == null || value.isEmpty) return "Title is required";
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              AppInput(
                radius: 10,
                label: "Address",
                validator: (value) {
                  if (value == null || value.isEmpty) return "Address is required";
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              AppInput(
                radius: 10,
                label: "Building No",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              AppInput(
                radius: 10,
                label: "Floor No",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              AppInput(
                radius: 10,
                label: "Apartment No",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  return null;
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: AppButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              goTo(page:  ShippingAddress());
            }
          },
          text: "Save",
          height: 50.h,
          width: double.infinity,
          borderRadius: 10,
        ),
      ),
    );
  }
}