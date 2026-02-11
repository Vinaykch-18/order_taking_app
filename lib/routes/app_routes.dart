import 'package:flutter/material.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/shop/presentation/product_list_screen.dart';

class AppRoutes {
  static const login = '/';
  static const products = '/products';

  static Map<String, WidgetBuilder> routes = {
    login: (_) => const LoginScreen(),
    products: (_) => const ProductListScreen(),
  };
}
