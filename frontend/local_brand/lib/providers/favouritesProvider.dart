import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/product.dart';

class FavoriteProductsNotifier extends StateNotifier<List<Product>> {
  FavoriteProductsNotifier() : super([]);
    bool toggleProductFavoriteStatus(Product product) {
    final productIsFavorite = state.any((favoriteProduct) => favoriteProduct.id == product.id);
    if (productIsFavorite) {
      state = state.where((p) => p.id != product.id).toList();
      return false;
    } else {
      state = [...state, product];
      return true;
    }
  }
  bool isProductInFavorites(Product product) {
    return state.any((favoriteProduct) => favoriteProduct.id == product.id);
  }
}
final favoriteProductProvider =
StateNotifierProvider<FavoriteProductsNotifier, List<Product>>((ref) {
  return FavoriteProductsNotifier();
});