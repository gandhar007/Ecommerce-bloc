import 'package:ecommerce_project/models/models.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Cart extends Equatable {
  List<Product> products;
  Cart({this.products = const <Product>[]});

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 20) {
      return 0;
    } else {
      return 1.00;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 20) {
      return 'You have Free Delivery.';
    } else {
      double missing = 20.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [products];
}
