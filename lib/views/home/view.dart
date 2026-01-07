import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/views/home/pages/cart.dart';
import 'package:suits/views/home/pages/fav.dart';
import 'package:suits/views/home/pages/home.dart';
import 'package:suits/views/home/pages/profile.dart';

import '../../core/ui/app_drawar.dart';
import '../../core/ui/app_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = [
    _Model("home.svg", HomePage()),
    _Model("cart.svg", CartPage()),
    _Model("fav.svg", FavPage()),
    _Model("person.svg", ProfilePage()),
  ];

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerBarrierDismissible: true,
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: 30,
      drawerScrimColor: Colors.black.withOpacity(0.3),
      drawer: DrawerItem(),

      body: list[currentIndex].pages,

      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(color: Colors.white),
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          currentIndex: currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                image: list[index].icon,
                color: currentIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
              ),
              label: "",
            ),
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String icon;

  final Widget pages;

  _Model(this.icon, this.pages);
}
