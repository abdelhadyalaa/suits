import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_image.dart';

class ProductDetailsSheet extends StatelessWidget {
  const ProductDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Text("Promo Code"),
                Spacer(),
                AppButton(text: "Apply", height: 24, width: 90),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub-Total", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey[600])),
                Text("\$407.94", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Free", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey[600])),
                Text("\$25.00", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Disscount", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey[600])),
                Text("-\$35.00", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Text("-"*100,maxLines: 1,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Cost", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey[600])),
                Text("\$397.94", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          AppButton(text: "Proceed to Checkout",borderRadius: 10,)

        ],
      ),
    );
  }
}
