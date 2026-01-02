import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/helper_methods.dart';
import 'app_image.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 286,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/boarding_one.png"),
                ),
                SizedBox(height: 12),
                Text(
                  "Abdelhady Alaa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  "01016225354",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // _Item(title: "About Us", imageIcon: "info.svg", page: AboutUs()),
          _Item(title: "Rate Our App", imageIcon: "rate.svg"),
          _Item(
            title: "Suggestions",
            imageIcon: "suggestion.svg",
            // page: Suggest(),
          ),
          _Item(
            title: "Enable Easy Login",
            imageIcon: "Subtract.svg",
            hasSwitch: true,
          ),
          _Item(
            title: "Logout",
            imageIcon: "logout.svg",
            isLogout: true,
            // page: LoginView(),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final String title;
  final String imageIcon;
  final Widget? page;
  final bool isLogout;
  final bool hasSwitch;

  const _Item({
    required this.title,
    required this.imageIcon,
    this.hasSwitch = false,
    this.isLogout = false,
    this.page,
  });

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
        color: widget.isLogout
            ? Colors.red.withValues(alpha: 0.2)
            : Color(0x2842431A).withValues(alpha: 0.10),
        border: Border.all(color: Colors.grey, width: 1),
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
        leading: AppImage(image: widget.imageIcon, height: 24.h, width: 24.w),
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: widget.isLogout ? Colors.red : Colors.black,
          ),
        ),
        trailing: widget.hasSwitch
            ? Switch(
                activeThumbColor: Colors.white,
                activeTrackColor: Colors.blue,

                value: switchValue,
                onChanged: (bool value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              )
            : null,
        onTap: () {
          goTo(page: widget.page!);
        },
      ),
    );
  }
}
