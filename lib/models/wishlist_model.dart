// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ecommerce_project/models/models.dart';

class Wishlist extends Equatable {
  final List<Product> products;

  const Wishlist({
    this.products = const <Product>[],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
