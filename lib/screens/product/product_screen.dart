// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_project/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_project/models/product_model.dart';
import 'package:ecommerce_project/widgets/custom_appbar.dart';
import 'package:ecommerce_project/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(
              product: product,
            ));
  }

  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: product.name,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          context
                              .read<WishlistBloc>()
                              .add(AddWishlistProduct(product));

                          const snackBar = SnackBar(
                              backgroundColor: Colors.black,
                              content: Text('Added to your Wishlist!'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ));
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(product));

                          const snackBar = SnackBar(
                              backgroundColor: Colors.black,
                              content: Text('Added to your Cart!'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Text(
                          'ADD TO CART',
                          style: Theme.of(context).textTheme.headline3,
                        ));
                  },
                )
              ],
            ),
          ),
        ),
        body: ListView(children: [
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarouselCard(
                  product: product,
                )
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
