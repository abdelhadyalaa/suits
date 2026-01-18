import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/ui/app_button.dart';

class ShoppingAddress extends StatelessWidget {
  ShoppingAddress({super.key});

  final List<String> categories = [
    "Home",
    "Office",
    "Parent’s House",
    "Frind’s House",
  ];

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
        title: const Text("Shopping Address"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50.h),
              ...List.generate(
                categories.length,
                (index) => _Item(locationName: categories[index]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    dashPattern: const [9, 5],
                    radius: Radius.circular(8.r),
                    color: Theme.of(context).primaryColor,
                    strokeWidth: 1,
                  ),

                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        "+ Add New Shipping Adress",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: AppButton(
          onPressed: () {},
          text: "Continue to payment",
          height: 50.h,
          width: double.infinity,
          borderRadius: 10,
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.locationName});

  final String locationName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              SizedBox(width: 10.w),
              Text(
                locationName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          const Text(
            "Dakahlia, Mansoura, Al-Gamaa District,\nAl-Sabahi Street",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(height: 20.h),
          const Divider(),
          SizedBox(height: 22.h),
        ],
      ),
    );
  }
}
