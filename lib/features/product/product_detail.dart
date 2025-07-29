import 'package:barka/features/custom_app_bar/sliver_app_bar.dart';
import 'package:barka/features/product/product_info_card.dart';
import 'package:flutter/material.dart';

import '../object_classes/product_class.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //   Sliver app bar
            customAppBar(),
            ProductInfoCard(
              description:
                  "Un prduit pas comme les autres, tres efficace et originale pour un prix tres abordable",
              price1: "4000",
              price2: "4200",
              price3: "4100",
            ),
            //   Logictic & refund info
            //   Characteristics
            //   Store infos
            //   Details photos of the products
          ],
        ),
      ),
    );
  }
}
