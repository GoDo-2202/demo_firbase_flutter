import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMemberService {
  final String? uid;
  DatabaseMemberService({this.uid});

  final CollectionReference performerCollection =
      FirebaseFirestore.instance.collection('member');

  Future updateMemberProfileData(
      String name, int age, String image, String description) async {
    return await performerCollection.doc(uid).set(
        {'name': name, 'age': age, 'image': image, 'description': description});
  }
}
