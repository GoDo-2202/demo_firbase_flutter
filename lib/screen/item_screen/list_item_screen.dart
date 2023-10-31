import 'package:demo_firbase_app/models/item.dart';
import 'package:demo_firbase_app/screen/item_screen/item_ceil.dart';
import 'package:demo_firbase_app/services/database/database_item_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListItemScreen extends StatefulWidget {
  const ListItemScreen({super.key});

  @override
  State<ListItemScreen> createState() => _ListItemScreenState();
}

class _ListItemScreenState extends State<ListItemScreen> {
  List<Item> listData = [];
  final DatabaseItemService databaseItemService = DatabaseItemService();

  void getItem() async {
    listData = await databaseItemService.getItem();
  }

  @override
  void initState() {
    super.initState();
    getItem();
    print("Check data _ListItemScreenState $listData");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    const title = 'Grid List';
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: FutureBuilder(
          future: databaseItemService.getItem(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.count(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              // Generate 100 widgets that display their index in the List.
              children: List.generate(listData.length, (index) {
                return ItemCeil(itemCeil: listData[index]);
              }),
            );
          }),
    );
  }
}
