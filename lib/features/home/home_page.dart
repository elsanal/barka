import 'package:barka/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/product_card.dart';
import '../product/product_detail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(10, (index) => {
      "name": "Sac a main de derniere generation $index",
      "price": 29.99 + index,
      "image": "assets/images/img${index+1}.jpeg"
    });

    return Scaffold(
      appBar: AppBar(title: const Text("NeoShop")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBarWithCategories(
                categories: ['Bags', 'Shoes', 'T-Shirts', 'Electronics', 'Kids', 'Home', 'Sale']
            ),
            MasonryGridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final product =  products[index];
                return productCardView(context, index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
