import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? idade;
  String? nome;
  DocumentReference? documentReference;

  UserModel({
    this.nome,
    this.idade,
    this.documentReference,
  });

  factory UserModel.fromMap(
      QueryDocumentSnapshot doc, Map<String, dynamic> docMap) {
    return UserModel(
      idade: docMap['idade'] ?? '',
      nome: docMap['nome'] ?? '',
      documentReference: doc.reference,
    );
  }

   Future delete() {
      return documentReference!.delete();
    }

  Future save() async {
    if (documentReference == null) {
      int total = await FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((value) => value.docs.length);
      documentReference =
          await FirebaseFirestore.instance.collection('users').add(
        {
          'idade': idade,
          'nome': nome,
          'id': total,
        },
      );
    } else {
      documentReference!.update(
        {
          'idade': idade,
          'nome': nome,
        },
      );
    }

   
  }
}
