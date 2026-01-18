import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';

import '../../core/ui/app_image.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List<String> items = [
    "Classic Blazar",
    "Classic Blazar",
    "Classic Blazar",
    "Classic Blazar",
  ];
  int _counter = 1;

  void _plus() {
    setState(() {
      _counter++;
    });
  }

  void _minus() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        ),
        title: Text("Chekout"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 22.h),
            Text(
              "Shipping Address",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
            ),
            SizedBox(height: 26.h),
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 10.w),
                Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              "Dakahlia, Mansoura, Al-Gamaa District, Al-Sabahi Street",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 30.h),
            Text(
              "Order List",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
            ),
            ...List.generate(
              items.length,
              (index) => Container(
                height: 150,
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: AppImage(
                        image: "boarding2.jpg",
                        width: 120,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Classic Blazar",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "Size:xl",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          "\$83.97",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: _minus,
                            icon: Icon(
                              Icons.remove,

                              size: 20.sp,
                              color: _counter > 1
                                  ? Colors.white
                                  : Colors.black26,
                            ),
                          ),
                        ),
                        Text(
                          '$_counter',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: _plus,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: AppButton(
          onPressed: () {
            setState(() {

            });

          },
          text: "Continue to payment",
          height: 50.h,
          width: double.infinity,
          borderRadius: 10,
        ),
      ),
    );
  }
}
