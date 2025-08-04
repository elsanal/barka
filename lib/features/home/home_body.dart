import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/product_card.dart';
import '../object_classes/product_class.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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

    return MasonryGridView.builder(
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
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
          child: productCardView(context, index),
        );
      },
    );
  }
}
