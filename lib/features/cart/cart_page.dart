import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../object_classes/product_class.dart';

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
    final List<Product> products = List.generate(
      7,
      (index) => Product(
        id: 'p$index',
        name: 'Sac à main de dernière génération $index',
        price: 29.99 + index,
        imageUrl: 'assets/images/img${index + 3}.jpeg',
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Votre Panier")),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        'productDetails',
                        pathParameters: {'id': product.id},
                        extra: product,
                      );
                    },
                    child: _CartItemCard(index: index),
                  );
                },
              ),
            ),
          ],
        ),
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
