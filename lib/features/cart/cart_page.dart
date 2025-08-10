import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final categories = const [
    'Tout',
    'Électroniques',
    'Alimentaire',
    'Motorisé',
    'Habillement',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryChips(),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _CartItemCard(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return ChoiceChip(
            label: Text(
              categories[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            selected: isSelected,
            onSelected: (_) => setState(() => selectedIndex = index),
            selectedColor: Colors.deepOrange,
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
              side: BorderSide(
                color: isSelected ? Colors.deepOrange : Colors.grey.shade400,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final int index;
  const _CartItemCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          // Shop header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ListTile(
              leading: Checkbox(value: true, onChanged: (_) {}),
              title: Text("Boutique de la Martinique"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          Divider(height: 1, color: Colors.grey[300]),
          // Product row
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoCheckbox(value: true, onChanged: (_) {}),
                SizedBox(
                  width: 200.w,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        "assets/images/img10.jpeg",
                        fit: BoxFit.cover,
                        cacheWidth: 200,
                        cacheHeight: 200,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sac de meilleure qualité",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "8374 FCFA",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                              fontSize: 30.sp,
                            ),
                          ),
                          _QuantityControl(),
                        ],
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
}

class _QuantityControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              print("Remove more");
            },
            icon: Icon(Icons.remove_circle_outline_outlined, size: 50.w),
            splashRadius: 20,
            iconSize: 60.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text("1", style: TextStyle(fontSize: 40.sp)),
          ),
          IconButton(
            onPressed: () {
              print("add more");
            },
            icon: Icon(Icons.add_circle_outline_outlined, size: 50.w),
            splashRadius: 20,
            iconSize: 60.w,
          ),
        ],
      ),
    );
  }
}
