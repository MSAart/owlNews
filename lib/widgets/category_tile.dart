import 'package:flutter/material.dart';
import 'package:owlnews/constant/utils.dart';

class CategoryTile extends StatefulWidget {
  final categoryName;
  VoidCallback onTap;
  CategoryTile({required this.onTap, this.categoryName, Key? key})
      : super(key: key);

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                widget.categoryName,
                style: poppinsbold12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
