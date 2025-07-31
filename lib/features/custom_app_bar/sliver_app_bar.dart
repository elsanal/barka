import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customAppBar() {
  return SliverAppBar(
    floating: false,
    pinned: false,
    snap: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    expandedHeight: 820.h,
    excludeHeaderSemantics: true,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      collapseMode: CollapseMode.parallax,
      background: appBarBackground(),
    ),
  );
}

Widget appBarBackground() {
  return Swiper(
    itemCount: 10,
    scrollDirection: Axis.horizontal,
    loop: true,
    viewportFraction: 0.8,
    outer: true,
    control: SwiperControl(
      color: Colors.black,
      size: 60.w,
      padding: EdgeInsets.all(8),
    ),
    pagination: SwiperPagination(
      builder: DotSwiperPaginationBuilder(
        color: Colors.grey,
        activeColor: Colors.blue,
      ),
    ),
    //pagination: swiperPagination(),
    itemBuilder: (BuildContext context, int index) {
      return Image.asset(
        "assets/images/img${index + 1}.jpeg",
        fit: BoxFit.fill,
        height: 1180.h,
        width: 1180.w,
      );
    },
  );
}
