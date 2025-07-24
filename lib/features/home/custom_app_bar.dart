import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopAppBarWithCategories extends StatelessWidget {
  final List<String> categories;

  const TopAppBarWithCategories({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔍 Combined Search + Icons
        Padding(
          padding: EdgeInsets.all(30.w),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.image_search),
                    tooltip: 'Search by image',
                    onPressed: () {
                      // TODO: implement image search
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    tooltip: 'Scan object',
                    onPressed: () {
                      // TODO: implement scanning
                    },
                  ),
                ],
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(color: Colors.black, width: 5.w, style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(color: Colors.orange, width: 8.w, style: BorderStyle.solid),
              )
            ),
          ),
        ),

        // 📚 Horizontal categories list
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return Chip(
                label: Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.sp, // Adjusted to better fit a Chip
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),
                //labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                backgroundColor: Colors.grey[200],
                padding: EdgeInsets.all(4),
              )
              ;
            },
          ),
        ),
      ],
    );
  }
}
