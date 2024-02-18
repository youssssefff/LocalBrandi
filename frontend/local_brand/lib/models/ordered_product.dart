import 'package:local_brand/models/product.dart';

import 'package:local_brand/models/product.dart';

class OrderedProduct {
  final Product product;
  final int quantity;
  final String size;

  OrderedProduct({
    required this.product,
    required this.quantity,
    required this.size,
  });

  OrderedProduct copyWith({
    Product? product,
    int? quantity,
    String? size,
  }) {
    return OrderedProduct(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
    );
  }
}