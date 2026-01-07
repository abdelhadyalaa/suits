import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_image.dart';

import '../../../core/ui/taps.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      _Model(
        image:
            "https://i.pinimg.com/736x/20/7f/58/207f580f2451af43b98102bc36bed3b9.jpg",
        title: "T-shirt",
      ),

      _Model(
        image:
            "https://avatars.mds.yandex.net/i?id=c4120bc436ec3e1deed7e2f10925c6320f9982b6-8498443-images-thumbs&n=13",
        title: "Shirts",
      ),
      _Model(
        image:
            "https://avatars.mds.yandex.net/i?id=bc7fa24b065cab976f52db11acf6b932ce13abd2-7086399-images-thumbs&n=13",
        title: "Dresses",
      ),
      _Model(
        image:
            "https://avatars.mds.yandex.net/i?id=c02de98125446bb8ec81e0086eff43c9685ec26f-4008503-images-thumbs&n=13",
        title: "Classic dresses",
      ),
      _Model(
        image:
            "https://avatars.mds.yandex.net/i?id=d2ee98f3d25207dba8ee2d4c18e55e066d628518-5258298-images-thumbs&n=13",
        title: "underwear",
      ),
      _Model(
        image:
            "https://avatars.mds.yandex.net/i?id=a12f76aca28f79e4747f94397eb60f1f6c983869-15365595-images-thumbs&n=13",
        title: "Wool trousers",
      ),
      _Model(
        image:
            "https://avatars.mds.yandex.net/i?id=3bd6ee9c792d3fd9c2cfa92be37886cb25ae6fe0-5869282-images-thumbs&n=13",
        title: "Undershirt",
      ),
      _Model(
        image:
            "https://liga-spec.ru/wp-content/uploads/2025/02/bc08cf30bcb42f3548553d669d5c6d8e-1536x1536.png",
        title: "Collection",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsetsDirectional.only(start: 16.0),
          child: Text(
            "Hello Safia",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              width: double.infinity.w,
              height: 150.h,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "New Collection",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Disscount 50% for\nthe first transaction",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      AppButton(
                        text: "Shop Now",
                        borderRadius: 10,
                        width: 100.w,
                        height: 30.h,
                      ),
                    ],
                  ),
                  Spacer(),
                  AppImage(
                    image:
                        "https://liga-spec.ru/wp-content/uploads/2025/02/bc08cf30bcb42f3548553d669d5c6d8e-1536x1536.png",
                    width: 110.w,
                    height: 100.h,
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                Text(
                  "Categary",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  "See All",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            SizedBox(
              height: 110.h, // حدد طول معين هنا عشان الـ ListView الأفقي يظهر
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,

                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      width: 70.w,
                      height: 70.h,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: AppImage(
                          image: list[index].image,
                          width: 20.w,
                          height: 20.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      list[index].title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35.h),
            Text(
              "Flash Sale",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            TapsWidget(),
          ],
        ),
      ),
    );
  }
}

class _Model {
  final String image, title;

  _Model({required this.image, required this.title});
}
