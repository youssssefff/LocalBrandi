import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductImageNotifier extends StateNotifier<String> {
  ProductImageNotifier() : super('');

  bool addImage(String image) {
    state = image;
    return true;
  }

}

final productImageProvider = StateNotifierProvider<ProductImageNotifier, String>((ref) {
  return ProductImageNotifier();
});

