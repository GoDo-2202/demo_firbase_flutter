import 'package:demo_firbase_app/extentions/styled_button.dart';
import 'package:demo_firbase_app/services/database/database_item_service.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final DatabaseItemService itemService = DatabaseItemService();

  final _cleanNameTextField = TextEditingController();

  final _cleanPriceTextField = TextEditingController();

  void _cleanText() {
    _cleanNameTextField.clear();
    _cleanPriceTextField.clear();
  }

  String name = '';

  String price = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add item'),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
            TextFormField(
              controller: _cleanNameTextField,
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                hintText: 'Name item',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _cleanPriceTextField,
              onChanged: (value) {
                price = value;
              },
              decoration: InputDecoration(
                hintText: 'Price item',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            StyledButton(
                text: 'Add',
                onPressed: () {
                  itemService.updateItemProfileData(name, double.parse(price));
                }),
            const SizedBox(height: 10),
            StyledButton(
                text: 'Clean',
                onPressed: () {
                  _cleanText();
                }),
          ],
        ),
      ),
    );
  }
}
