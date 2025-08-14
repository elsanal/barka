import 'package:barka/features/auth/login.dart';
import 'package:barka/features/auth/register.dart';
import 'package:barka/features/cart/cart_page.dart';
import 'package:barka/features/chat/chat_page.dart';
import 'package:barka/features/tracker/tracker_page.dart';
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
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => CartPage(),
    ),
    GoRoute(
      path: '/orders',
      name: 'orders',
      builder: (context, state) => OrdersListPage(),
    ),
    GoRoute(
      path: '/contact_us',
      name: 'contact_us',
      builder: (context, state) => ContactUsPage(),
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
