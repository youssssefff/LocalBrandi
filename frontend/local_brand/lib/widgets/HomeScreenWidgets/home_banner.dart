import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 8*26,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://marketplace.canva.com/EAFHHDwoO6M/1/0/1600w/canva-brown-and-grey-minimalist-fashion-collection-sale-banner-UGM0UgciPLs.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
