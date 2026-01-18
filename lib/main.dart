import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/splash.dart';
import 'package:suits/views/auth/login.dart';
import 'package:suits/views/home/pages/fav.dart';

import 'core/logic/helper_methods.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        builder: (context, child) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xffF4F5F7),
            elevation: 0,
          ),
          primaryColor: Color(0xffDD8560),
          fontFamily: 'Inter',
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D1D1E),
            ),
            titleMedium: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff0D1D1E),
            ),
            titleSmall: TextStyle(fontSize: 6, fontWeight: FontWeight.w400),
          ),
          scaffoldBackgroundColor: Color(0xffF4F5F7),
        ),
        home: FavPage(),
        navigatorKey: navKey,
      ),
    );
  }
}
