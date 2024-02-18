import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/CategoryListView/category_view_item.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key? key,required this.currentSelction ,required this.categories,required this.callback}) : super(key: key);
  List<String> categories;
  final  int currentSelction;
  final Function(int) callback;
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                widget.callback(index);
              },
              child: CategoryViewItem(
                categoryTitle: widget.categories[index],
                selected: index == widget.currentSelction ? true : false,
              ));
        },
      ),
    );
    ;
  }
}
