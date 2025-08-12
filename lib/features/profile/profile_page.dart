import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Profile Header ---
            Container(
              color: Colors.redAccent,
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 100.r,
                    backgroundImage: AssetImage(
                      "assets/images/user.jpg", // user image
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Delivery Address",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 40.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.white),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // --- My Orders ---
            _sectionHeader("My Orders", "Total Saved: \$273.42"),
            _iconRow([
              _iconButton(Icons.payment, "Pending Payment"),
              _iconButton(Icons.inventory, "Packaging"),
              _iconButton(Icons.local_shipping, "On Delivery"),
            ]),

            SizedBox(height: 10.h),

            // --- Features ---
            _iconRow([
              _iconButton(Icons.favorite, "Favorites"),
              _iconButton(Icons.remove_red_eye, "Viewed Items"),
              _iconButton(Icons.attach_money, "Refunds"),
            ]),

            SizedBox(height: 10.h),

            // --- Suggested Products ---
            _sectionHeader("You May Like", ""),
            GridView.builder(
              padding: EdgeInsets.all(8.w),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8.w,
                crossAxisSpacing: 8.w,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _productCard();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 35.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _iconRow(List<Widget> items) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _iconButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 60.sp, color: Colors.redAccent),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 35.sp)),
      ],
    );
  }

  Widget _productCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
              child: Image.asset(
                "assets/images/img10.jpeg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Name",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "\$10.99",
                  style: TextStyle(color: Colors.redAccent, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
