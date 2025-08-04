import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showItemSelection(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ────── Top Info Bar ──────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    "assets/images/img10.jpeg",
                    height: 200.h,
                    width: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sélection actuelle",
                        style: TextStyle(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "253 articles sélectionnés",
                        style: TextStyle(
                          fontSize: 45.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            // SizedBox(height: 8.h),
            Divider(height: 5),

            // ────── Scrollable Selection Grid ──────
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  children: List.generate(8, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Optionally toggle selection
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.grey[300]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.1),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            "assets/images/img${index + 3}.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Divider(height: 0.0),

            // ────── Payment Summary Bar ──────
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nombre total",
                        style: TextStyle(
                          fontSize: 50.sp,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "1000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Montant total:",
                        style: TextStyle(
                          fontSize: 50.sp,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "2 593 058 FCFA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mode de Livraison:",
                        style: TextStyle(
                          fontSize: 50.sp,
                          color: Colors.black54,
                        ),
                      ),
                      Text("Bateau", style: TextStyle(fontSize: 50.sp)),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  // ────── Confirm Button ──────
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 80.h,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print("Arrived payed");
                      },
                      icon: Icon(Icons.payment),
                      label: Text(
                        "Confirmer et Payer",
                        style: TextStyle(fontSize: 50.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
