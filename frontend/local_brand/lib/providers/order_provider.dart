import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/order.dart';
import 'package:local_brand/models/ordered_product.dart';
class OrdersNotifier extends StateNotifier<List<Order>> {
  OrdersNotifier() : super([]);

  void addOrder(List<OrderedProduct> orderedProducts) {
    state = [...state, Order(orderedProducts: orderedProducts)];
  }

  void deleteOrder(Order order) {
    state = state.where((existingOrder) => existingOrder != order).toList();
  }
}

final ordersProvider =
StateNotifierProvider<OrdersNotifier, List<Order>>((ref) {
  return OrdersNotifier();
});