import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/product_card_simple.dart';
import '../object_classes/product_class.dart';

Widget similarProducts(BuildContext context) {
  final List<Product> products = List.generate(
    7,
    (index) => Product(
      id: '$index',
      name: 'Sac à main de dernière génération $index',
      price: 29.99 + index,
      imageUrl: 'assets/images/img${index + 3}.jpeg',
    ),
  );

  return SliverToBoxAdapter(
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Text(
              "Produits similaires",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
            ),
          ),
          SizedBox(
            height: 500, // Height = (item height * 2) + spacing
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 🔥 Two rows
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.3, // width / height
              ),
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
                  child: productCardViewSimple(context, index + 3),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
