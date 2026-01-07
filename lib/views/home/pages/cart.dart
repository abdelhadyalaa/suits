import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:suits/core/ui/app_image.dart';

import '../../../core/ui/bottom_sheete.dart';
import '../../../core/ui/item_apply.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("My cards"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Slidable(
                key: ValueKey(items[index]),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.25,
                  dismissible: DismissiblePane(
                    onDismissed: () => _deleteItem(index),
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) => _deleteItem(index),
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const ProductDetailsSheet(),
                          );
                        },
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
            ),
          );
        },
      ),
    );
  }

  void _deleteItem(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => DeleteConfirmationSheet(
        onConfirm: () {
          setState(() {
            items.removeAt(index);
          });

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("تم حذف المنتج بنجاح"),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
