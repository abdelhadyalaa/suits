import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_image.dart';

import '../../views/home/item_page.dart';

class TapsWidget extends StatefulWidget {
  final bool isFav;

  const TapsWidget({super.key, this.isFav = false});

  @override
  State<TapsWidget> createState() => _TapsWidgetState();
}

class _TapsWidgetState extends State<TapsWidget> {
  int selectedTab = 0;

  final List<String> categories = ["All", "Newest", "Popular", "Men", "Women"];

  final Map<int, List<String>> categoryImages = {
    0: [
      "https://avatars.mds.yandex.net/i?id=fcb5207b6fb495a9ff558aebe481af99762bbe1765bdc052-12538254-images-thumbs&n=13",
      "https://avatars.mds.yandex.net/i?id=22487643b7c708ca1f68c8c46fa5ae2ab2f5692a-16479425-images-thumbs&n=13",
      "https://avatars.mds.yandex.net/i?id=ce9b64abd74c4d41dec56956b6f80ce743cda70c-16454189-images-thumbs&n=13",
      "https://avatars.mds.yandex.net/i?id=886c18b1ec23f1ed7aed0dc93ab4ca811553d02e-5384017-images-thumbs&n=13",
    ],
    1: [
      "https://avatars.mds.yandex.net/i?id=c02de98125446bb8ec81e0086eff43c9685ec26f-4008503-images-thumbs&n=13",
    ],
    2: [
      "https://avatars.mds.yandex.net/i?id=bc7fa24b065cab976f52db11acf6b932ce13abd2-7086399-images-thumbs&n=13",
    ],
    3: [
      "https://avatars.mds.yandex.net/i?id=c4120bc436ec3e1deed7e2f10925c6320f9982b6-8498443-images-thumbs&n=13",
    ],
    4: [
      "https://avatars.mds.yandex.net/i?id=a12f76aca28f79e4747f94397eb60f1f6c983869-15365595-images-thumbs&n=13",
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedTab == index;
              return GestureDetector(
                onTap: () => setState(() => selectedTab = index),
                child: Container(
                  margin: EdgeInsetsDirectional.only(end: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 20.h),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: widget.isFav ? 0.75 : 0.9,
          ),
          itemCount: categoryImages[selectedTab]?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                goTo(page: ItemPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.r),
                            ),
                            child: AppImage(
                              image: categoryImages[selectedTab]![index],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (widget.isFav)
                            Positioned(
                              top: 8.h,
                              right: 8.w,
                              child: GestureDetector(
                                onTap: () => print("Heart Clicked!"),
                                child: CircleAvatar(
                                  radius: 14.r,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Theme.of(context).primaryColor,
                                    size: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.isFav
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Product Name",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16.sp,
                                        ),
                                        Text(
                                          " 4.5",
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Text(
                                  "Product Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),

                          if (widget.isFav) ...[
                            SizedBox(height: 4.h),
                            Text(
                              "1,200 EGP",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
