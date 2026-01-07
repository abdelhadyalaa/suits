import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_image.dart';

import '../../../core/logic/helper_methods.dart';
import '../../checkout_cycle/payment_methods.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 22.h),
              Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CircleAvatar(
                radius: 70.r,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: AppImage(
                    image:
                        "https://media.zenfs.com/en/the_bolde_articles_237/f5c9586e5db23eb8c09bea615bf82980",
                    width: 140.r,
                    height: 140.r,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Center(
                child: Text(
                  "Safia Ayman",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _Item(title: "Your Profile", imageIcon: "person.png"),
              _Item(title: "My Order", imageIcon: "menu.png"),
              _Item(title: "Payment Methods", imageIcon: "credit_card.png",page: PaymentMethods(),),
              _Item(title: "Wishlist", imageIcon: "fav.svg"),
              _Item(title: "Setting", imageIcon: "setting.png"),
              _Item(title: "Log Out", imageIcon: "logout.png"),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final String title;
  final String imageIcon;
  final Widget? page;

  const _Item({required this.title, required this.imageIcon, this.page});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: AppImage(
          image: widget.imageIcon,
          height: 20.h,
          width: 20.w,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),

        onTap: () {
          goTo(page: widget.page!);
        },
      ),
    );
  }
}
