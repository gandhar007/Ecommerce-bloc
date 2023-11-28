// ignore_for_file: deprecated_member_use
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/models/category_model.dart';
import 'package:ecommerce_project/models/product_model.dart';
import 'package:ecommerce_project/widgets/custom_appbar.dart';
import 'package:ecommerce_project/widgets/custom_navbar.dart';
import 'package:ecommerce_project/widgets/hero_carousel_card.dart';
import 'package:ecommerce_project/widgets/product_carousel.dart';
import 'package:ecommerce_project/widgets/section_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Zero To Unicorn',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
            const SectionTile(
              title: 'RECOMMENDED',
            ),
            ProductCarousel(
              products: Product.products
                  .where((product) => product.isRecommended)
                  .toList(),
            ),
            const SectionTile(
              title: 'POPULAR',
            ),
            ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
