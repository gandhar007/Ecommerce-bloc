// ignore_for_file: deprecated_member_use

import 'package:ecommerce_project/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_project/widgets/custom_appbar.dart';
import 'package:ecommerce_project/widgets/custom_navbar.dart';
import 'package:ecommerce_project/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishlistScreen());
  }

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Your Wishlist',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text('You have not added any product yet.',
                      style: Theme.of(context).textTheme.headline2)),
            );
          } else if (state is WishlistLoaded) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.1),
                itemCount: state.wishlist.products.length,
                itemBuilder: (context, index) {
                  return Center(
                      child: ProductCard(
                    isWishlist: true,
                    rightPosition: 120,
                    product: state.wishlist.products[index],
                    widthFactor: 1.1,
                  ));
                });
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
