import 'package:go_router/go_router.dart';

import '../features/home/home_page.dart';
import '../features/object_classes/product_class.dart';
import '../features/product/product_detail.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => HomePage()),
    GoRoute(
      path: '/product/:id',
      name: 'productDetails',
      builder: (context, state) {
        final product = state.extra as Product;
        return ProductDetailPage(product: product);
      },
    ),
  ],
);
