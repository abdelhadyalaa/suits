import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_image.dart';

import '../../auth/login.dart';
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
              SizedBox(height: 20.h),
              _Item(title: "Your Profile", imageIcon: "person.png"),
              _Item(title: "My Order", imageIcon: "menu.png"),
              _Item(
                title: "Payment Methods",
                imageIcon: "credit_card.png",
                page: const PaymentMethods(),
              ),
              _Item(title: "Wishlist", imageIcon: "fav.svg"),
              _Item(title: "Setting", imageIcon: "setting.png"),
              _Item(
                title: "Log Out",
                imageIcon: "logout.png",
                onTap: () => _showLogoutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        title: Text(
          "Log Out",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
        content: SizedBox(
          width: 350.w,
          child: Text(
            "Are you sure you want to log out?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: Colors.grey[700],
            ),
          ),
        ),
        actionsPadding: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
        actions: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    goTo(page: const LoginView(), canPop: false);
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        "Yes, Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String imageIcon;
  final Widget? page;
  final VoidCallback? onTap;

  const _Item({
    required this.title,
    required this.imageIcon,
    this.page,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: AppImage(
          image: imageIcon,
          height: 20.h,
          width: 20.w,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        onTap: () {
          if (onTap != null) {
            onTap!();
          } else if (page != null) {
            goTo(page: page!);
          }
        },
      ),
    );
  }
}
