import 'package:app/models/Product.dart';

class CartProduct {
  final int id;
  final int price;
  final int quantity;
  final int subtotal;
  final Product product;

  CartProduct({
    this.id,
    this.price,
    this.quantity,
    this.subtotal,
    this.product,
  });
}
