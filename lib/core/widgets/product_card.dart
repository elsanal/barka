import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



  Widget productCardView(BuildContext context,int index){
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
                    "Jolie habit pour bébé. Toutes les tailles existent.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Price Text
                  Text.rich(
                    TextSpan(
                      text: "Price: ",
                      style: TextStyle(fontSize: 30.sp),
                      children: [
                        TextSpan(
                          text: "\$8.99",
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: "  \$3.99",
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
            ),
          ],
        ),
      );
  }

