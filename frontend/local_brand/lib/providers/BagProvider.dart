import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/ordered_product.dart';
import 'package:local_brand/models/product.dart';

class BagNotifier extends StateNotifier<List<OrderedProduct>> {
  BagNotifier() : super([]);
  void addProductToBag(OrderedProduct orderedProduct) {
    final existingProductIndex = state.indexWhere(
            (productOrdered) =>
        productOrdered.product.id == orderedProduct.product.id &&
            productOrdered.size == orderedProduct.size);

    if (existingProductIndex != -1) {
      // If the product is already in the bag, update its quantity
      final updatedProduct = state[existingProductIndex].copyWith(
        quantity: state[existingProductIndex].quantity +
            orderedProduct.quantity,
      );

      // Create a new list with the updated product
      final updatedState = List<OrderedProduct>.from(state);
      updatedState[existingProductIndex] = updatedProduct;

      // Update the state
      state = updatedState;

      // Return the updated quantity
    } else {
      // If the product is not in the bag, add it with the specified quantity
      final productWithQuantity = orderedProduct.copyWith(
          quantity: orderedProduct.quantity,
          size: orderedProduct.size,
          product: orderedProduct.product);

      state = [...state, productWithQuantity];

      // Return the updated quantity
    }
  }

  int decreaseQuantity(OrderedProduct orderedProduct, int quantity) {
    final updatedState = state.map((productOrdered) {
      if (productOrdered.product.id == orderedProduct.product.id&& productOrdered.size == orderedProduct.size) {
        int newQuantity = productOrdered.quantity - quantity;
        if (newQuantity <= 0) {
          return null; // Return null to filter out this product
        } else {
          // Update the quantity for the existing product
          return productOrdered.copyWith(quantity: newQuantity);
        }
      }
      return productOrdered;
    }).where((p) => p != null).cast<OrderedProduct>().toList();

    state = updatedState;
    return state
        .firstWhere(
            (p) =>
        p.product.id == orderedProduct.product.id &&
            p.size == orderedProduct.size)
        .quantity;
  }

  int getQuantity(OrderedProduct orderedProduct) {
    final productInBag = state.firstWhere(
            (p) =>
        p.product.id == orderedProduct.product.id &&
            p.size == orderedProduct.size,
        );

    return productInBag?.quantity ?? 0;
  }
  int getTotalBagPrice() {
    int total = 0;

    for (OrderedProduct orderedProduct in state) {
      total += orderedProduct.quantity * orderedProduct.product.price;
    }

    return total;
  }

  int getTotalPrice(OrderedProduct orderedProduct) {
    final productInBag = state.firstWhere(
            (p) =>
        p.product.id == orderedProduct.product.id &&
            p.size == orderedProduct.size,);

    final totalPrice =
        productInBag.quantity * productInBag.product.price ?? 0;
    return totalPrice;
  }

  void removeProduct(OrderedProduct orderedProduct) {
    state = state
        .where((p) =>
    p.product.id != orderedProduct.product.id &&
        p.size != orderedProduct.size)
        .toList();
  }

  void clearBag() {
    state = [];
  }

  bool isInBag(Product product) {
    return state.any((p) =>
    p.product.id == product.id);
  }
}

final BagProvider =
StateNotifierProvider<BagNotifier, List<OrderedProduct>>((ref) {
  return BagNotifier();
});
