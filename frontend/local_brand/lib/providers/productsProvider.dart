import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/product.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);
  void addProducts(Product product){
  final productIs = state.contains(product);
  if (!productIs) {
    state = [...state, product];
    return;
    } else {
     return;
    }
  }
  Product getProductById(int productId) {
    return state.firstWhere((product) => product.id == productId, orElse: () => throw Exception('Product not found'));
  }
}
final productProvider =
StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});