import 'package:go_router/go_router.dart';

import '../features/chat/direct_chat.dart';
import '../features/home/home_page.dart';
import '../features/object_classes/product_class.dart';
import '../features/product/product_detail.dart';
import '../main_screens.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'root', builder: (context, state) => MainScreen()),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/directMessagePage',
      name: 'directMessage',
      builder: (context, state) => DirectMessagePage(),
    ),
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
