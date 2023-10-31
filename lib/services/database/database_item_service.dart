import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firbase_app/models/item.dart';

class DatabaseItemService {
  final CollectionReference collectionItem =
      FirebaseFirestore.instance.collection('item');

  Future updateItemProfileData(String name, double price) async {
    return await collectionItem.doc().set({
      'name': name,
      'price': price,
    }).then((result) {
      print('Success');
    }).catchError((error) {
      print(error);
    });
  }

  Future<List<Item>> getItem() async {
    List<Item> list = [];
    await collectionItem.get().then((item) {
      list.addAll(item.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        print('${doc.id} => ${doc.data()}');
        return Item(
            uid: doc.id, name: data['name'], price: data['price'].toString());
      }).toList());
    }, onError: (e) => print("Error completing: $e"));
    print("Check get list firebase $list");
    return list;
  }

  // Future getListItem(List<Item> list) async {
  //   return await collectionItem.get().then((item) {
  //     print("Successfully completed");
  //     for (var docSnapshot in item.docs) {
  //       final data = docSnapshot.data() as Map<String, dynamic>;
  //       list.add(Item(
  //           uid: docSnapshot.id,
  //           name: data['name'],
  //           price: data['price'].toString()));
  //       print('${docSnapshot.id} => ${docSnapshot.data()}');
  //     }
  //   }, onError: (e) => print("Error completing: $e"));
  // }
}
