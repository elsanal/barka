import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productCardViewSimple(BuildContext context, int index) {
  var random = Random();
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    clipBehavior: Clip.antiAlias,
    child: Container(
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1, // square
              child: Image.asset(
                'assets/images/img${1 + index}.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Description and price section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description Text
                Text(
                  "Jolie habit pour bébé. Toutes les tailles existent. Ces habites sont des"
                  "originaux et tres moins chers",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 30.sp, color: Colors.black87),
                ),
                SizedBox(height: 8.h),
                // Price Text
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Prix: ",
                        style: TextStyle(fontSize: 25.sp),
                        children: [
                          TextSpan(
                            text: " ${500 + random.nextInt(2000)} CFA",
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
