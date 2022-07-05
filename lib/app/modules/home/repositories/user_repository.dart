import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

abstract class IUserRepository {
  Stream<List<UserModel>> getUsers();
}

class UserRepository implements IUserRepository {
  FirebaseFirestore firebaseFirestore;

  UserRepository({
    required this.firebaseFirestore,
  });

  @override
  Stream<List<UserModel>> getUsers() {
    try {
      return firebaseFirestore
          .collection('users')
          .orderBy('id')
          .snapshots()
          .map(
        (query) {
          var result = query.docs.map((doc) {
            return UserModel.fromMap(
              doc,
              doc.data(),
            );
          }).toList();
          return result;
        },
      );
    } catch (e) {
      throw Exception();
    }
  }
}
