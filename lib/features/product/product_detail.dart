import 'package:barka/features/bottom_bar/product_bottom_bar.dart';
import 'package:barka/features/cart/add_to_card.dart';
import 'package:barka/features/product/logistic_refund.dart';
import 'package:barka/features/product/product_info_card.dart';
import 'package:barka/features/product/product_photos_show.dart';
import 'package:barka/features/product/similar_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../custom_app_bar/sliver_app_bar.dart';
import '../object_classes/product_class.dart';
import '../payment/articles_selection.dart';
import 'characteristics.dart';

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
        backgroundColor: Colors.grey[100],
        bottomNavigationBar: CustomBottomBar(
          onShop: () => {},
          onChat: () => {context.push('/contact_us')},
          onCartList: () => {context.push('/cart')},
          onAddToCart: () => {showItemSelectionForCart(context)},
          onProceedPayment: () => {showItemSelection(context)},
        ),
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
            SliverToBoxAdapter(child: Divider(height: 10.h, thickness: 5)),
            //   Logictic & refund info
            logisticRefundPolicy(context),
            SliverToBoxAdapter(child: Divider(height: 10.h, thickness: 5)),
            //   Characteristics
            productCharacteristicsPopUp(context),
            SliverToBoxAdapter(child: Divider(height: 10.h, thickness: 5)),
            //   Store infos
            similarProducts(context),
            SliverToBoxAdapter(child: Divider(height: 10.h, thickness: 5)),
            //   Details photos of the products
            productPhotosShow(context),
            SliverToBoxAdapter(child: Divider(height: 10.h, thickness: 5)),
          ],
        ),
      ),
    );
  }
}
