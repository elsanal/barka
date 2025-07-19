import 'package:flutter/material.dart';

import '../product/product_detail.dart';





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(10, (index) => {
      "name": "Product $index",
      "price": 29.99 + index,
      "image": "https://via.placeholder.com/150"
    });

    return Scaffold(
      appBar: AppBar(title: const Text("NeoShop")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => ProductDetailPage(product: product))),
            child: Column(
              children: [
                Image.asset('assets/images/hand_bag.jpg', height: 120),
                const SizedBox(height: 8),
                Text(product['name'] as String),
                Text("\$${product['price']}", style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
