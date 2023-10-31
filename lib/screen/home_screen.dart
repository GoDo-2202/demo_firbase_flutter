import 'package:demo_firbase_app/extentions/styled_button.dart';
import 'package:demo_firbase_app/screen/item_screen/add_item_screen.dart';
import 'package:demo_firbase_app/screen/item_screen/list_item_screen.dart';
import 'package:demo_firbase_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  void _addItemBook(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const AddItemScreen()),
    );
  }

  void _showListItem(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const ListItemScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Home'),
        actions: [
          TextButton.icon(
              onPressed: () async {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: const Text(
                'Setting',
                style: TextStyle(color: Colors.black),
              )),
          TextButton.icon(
              onPressed: () async {
                await AuthService().signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            StyledButton(text: 'Profile', onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            StyledButton(
                text: 'Add item',
                onPressed: () {
                  _addItemBook(context);
                }),
            const SizedBox(
              height: 10,
            ),
            StyledButton(
                text: 'Show list item',
                onPressed: () {
                  _showListItem(context);
                }),
          ],
        ),
      ),
    );
  }
}
