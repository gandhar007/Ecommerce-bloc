// ignore_for_file: deprecated_member_use
import 'package:ecommerce_project/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_project/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_project/models/product_model.dart';
import 'package:ecommerce_project/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double rightPosition;
  final bool isWishlist;
  const ProductCard(
      {super.key,
      required this.product,
      this.widthFactor = 2.5,
      this.rightPosition = 0,
      this.isWishlist = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(
                      product: product,
                    )));
      },
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 65,
            right: rightPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 70,
            left: 5,
            right: rightPosition + 5,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor - 10,
              height: 70,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ));
                        },
                      ),
                    ),
                    isWishlist
                        ? Expanded(
                            child: BlocBuilder<WishlistBloc, WishlistState>(
                              builder: (context, state) {
                                return IconButton(
                                    onPressed: () {
                                      context
                                          .read<WishlistBloc>()
                                          .add(RemoveWishlistProduct(product));
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.white,
                                    ));
                              },
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
