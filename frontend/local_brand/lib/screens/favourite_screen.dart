import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/providers/favouritesProvider.dart';
import 'package:local_brand/widgets/ShopScreenWidgets/shop_grid_view.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favourites = ref.watch(favoriteProductProvider );
    return Scaffold(
      backgroundColor: Colors.white,
      body: ShopGridView( productsList: favourites),
    );
  }
}
