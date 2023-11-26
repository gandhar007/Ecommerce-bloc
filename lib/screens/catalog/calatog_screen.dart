import 'package:ecommerce_project/models/category_model.dart';
import 'package:ecommerce_project/models/product_model.dart';
import 'package:ecommerce_project/widgets/custom_appbar.dart';
import 'package:ecommerce_project/widgets/custom_navbar.dart';
import 'package:ecommerce_project/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  final Category? category;
  const CatalogScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category!.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category!.name,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            return SizedBox(
              child: Center(
                  child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.25,
              )),
            );
          }),
    );
  }
}
