import 'package:demo_firbase_app/models/item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemCeil extends StatefulWidget {
  ItemCeil({super.key, required this.itemCeil});

  Item itemCeil;

  @override
  State<ItemCeil> createState() => _ItemCeilState();
}

class _ItemCeilState extends State<ItemCeil> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset(
              'assets/images/vo_dien.jpg',
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            widget.itemCeil.name,
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            widget.itemCeil.price,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
