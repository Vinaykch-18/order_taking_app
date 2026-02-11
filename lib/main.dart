import 'package:flutter/material.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const OrderTakingApp());
}

class OrderTakingApp extends StatelessWidget {
  const OrderTakingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Order Taking App',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
