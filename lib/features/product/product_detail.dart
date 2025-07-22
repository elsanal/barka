

import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/img10.jpeg', height: 120),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product['name'], style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text("\$${product['price']}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const Text("This is a sample product description."),
                const SizedBox(height: 24),
                ElevatedButton(onPressed: () {}, child: const Text("Add to Cart"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
