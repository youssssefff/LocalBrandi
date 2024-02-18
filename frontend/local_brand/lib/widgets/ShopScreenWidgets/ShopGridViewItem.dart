import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/product.dart';
import 'package:local_brand/providers/favouritesProvider.dart';
import 'package:local_brand/providers/product_image_provider.dart';
import 'package:local_brand/providers/productsProvider.dart';
import 'package:local_brand/screens/product_screen.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class ShopGridViewItem extends ConsumerStatefulWidget {
  ShopGridViewItem(
      {Key? key,
      required this.product,required this.isFavourite})
      : super(key: key);
  final Product product;
  final bool isFavourite;

  @override
  ConsumerState<ShopGridViewItem> createState() => _ShopGridViewItemState();
}

class _ShopGridViewItemState extends ConsumerState<ShopGridViewItem> {
  bool isFavorite =false;
  @override
  void initState() {
    // TODO: implement initState
    isFavorite = widget.isFavourite;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    bool localIsFavorite = isFavorite; // Use a local variable
    return GestureDetector(
      onTap: (){ref.read(productImageProvider.notifier).addImage(widget.product.images[0]); Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: widget.product,), // Replace with your widget
          ));},
      child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 8 * 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    alignment: Alignment.center,
                    width: 8 * 5,
                    height: 8 * 5,
                    child: IconButton(
                      onPressed: () {
                        ref
                            .read(favoriteProductProvider.notifier)
                            .toggleProductFavoriteStatus(widget.product);
                        setState(() {
                          isFavorite =!isFavorite;
                        });
                      },
                      icon: localIsFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 14,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextW500F16(text: 'BestSeller', link: false, color: Color(0xFFFC5100)),
                      SizedBox(
                        height: 4,
                      ),
                      TextW500F16(text: widget.product.title, link: false, color: Colors.black),
                      TextW400F16(text: '${widget.product.gender} ${widget.product.category}', link: false, color: Color(0xFF767676)),
                      SizedBox(
                        height: 4,
                      ),
                      TextW400F16(text: '${widget.product.price} EGP', link: false, color: Colors.black),
                    ]),
              ),
            ],
          )),
    );
  }
}
