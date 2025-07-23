import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



  Widget productCardView(BuildContext context,int index){
    var random = Random();
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Image.asset(
              'assets/images/img${1 + index}.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              //height: 160,
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.black87,
                    ),
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
                              text: (1000 + random.nextInt(5000)).toString(),
                              style: TextStyle(
                                fontSize: 30.sp,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
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
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                            text: "+${random.nextInt(2000)} vendu",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ))
                          ]
                        )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

