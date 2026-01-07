import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_image.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
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
      body: SafeArea(
        child: Stack(
          children: [
            AppImage(
              image: "boarding2.jpg",
              width: double.infinity.w,
              height: double.infinity.h,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Transform.rotate(
                      angle: 1 * math.pi,
                      child: AppImage(
                        image: "forward_stroke.svg",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.all(16.dg),
                  decoration: BoxDecoration(
                    color: const Color(0xffF4F5F7),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      topLeft: Radius.circular(25.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Female Style",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          const Spacer(),
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          Text(
                            " 4.5",
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Classic Blazer",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        "Product Details",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Text(
                        "cotton sweat shirt with a text point",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Quality",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(width: 30.w),
                          Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: _minus,
                                  icon: Icon(
                                    Icons.remove,
                                    size: 20.sp,
                                    color: _counter > 1
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                                Text(
                                  '$_counter',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: _plus,
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          Text("Color :"),
                          SizedBox(width: 20.w),
                          Row(
                            children: [
                              _ItemColor(color: Colors.red),
                              SizedBox(width: 10.w),
                              _ItemColor(color: Colors.blue),
                              SizedBox(width: 10.w),
                              _ItemColor(color: Colors.green),
                              SizedBox(width: 10.w),
                              _ItemColor(color: Colors.yellow),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text("Size :"),
                          SizedBox(width: 28.w),
                          Row(
                            children: [
                              _ItemSize(size: "S"),
                              SizedBox(width: 10.w),
                              _ItemSize(size: "M"),
                              SizedBox(width: 10.w),
                              _ItemSize(size: "L"),
                              SizedBox(width: 10.w),
                              _ItemSize(size: "XL"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                ),
                              ),

                              child: Center(
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(width: 30.w,),
                            Expanded(
                              child: AppButton(
                                text: "Add To Cart",
                                borderRadius: 10,
                                height: 50.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemColor extends StatelessWidget {
  final Color color;

  const _ItemColor({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 25.h,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _ItemSize extends StatelessWidget {
  final String? size;

  const _ItemSize({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 25.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Center(child: Text("$size")),
    );
  }
}
