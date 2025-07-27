import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopAppBarWithCategories extends StatefulWidget {
  final List<String> categories;

  const TopAppBarWithCategories({
    super.key,
    required this.categories,
  });

  @override
  State<TopAppBarWithCategories> createState() => _TopAppBarWithCategoriesState();
}

class _TopAppBarWithCategoriesState extends State<TopAppBarWithCategories> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔍 Search bar with image and scan icons
        Padding(
          padding: EdgeInsets.all(30.w),
          child: GestureDetector(
          onTap: () {
          FocusScope.of(context).unfocus(); // Unfocus keyboard when tapping elsewhere
          },
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
                  borderSide: BorderSide(color: Colors.black, width: 3.5.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: Colors.black, width: 4.5.w),
                ),

              ),
            ),
          ),
        ),
        // 📚 Horizontal category chips
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return ChoiceChip(
                label: Text(
                  widget.categories[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                selected: selectedIndex == index,
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = selected ? index : selectedIndex;
                  });
                  print(widget.categories[index]);
                },
                selectedColor: Colors.deepOrange,
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: selectedIndex == index ? Colors.deepOrange : Colors.grey.shade400,
                  ),
                ),
                // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                padding: EdgeInsets.only(bottom: 20.h),
              );
            },
          ),
        ),
      ],
    );
  }
}
