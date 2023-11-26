import 'package:ecommerce_project/widgets/custom_appbar.dart';
import 'package:ecommerce_project/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Your Cart',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
