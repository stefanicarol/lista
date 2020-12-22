import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/home/models/list_model.dart';

import '../models/list_model.dart';
import 'interfaces/todo_repository_interface.dart';

class TodoRepository extends Disposable implements ITodoRepository {
  final FirebaseFirestore firestore;

  TodoRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Stream<List<ListModel>> get() {
    return FirebaseFirestore.instance
        .collection('todo')
        .orderBy('position')
        .snapshots()
        .map((query) =>
            query.docs.map((doc) => ListModel.fromDocument(doc)).toList());
  }

  @override
  Future<Stream<ListModel>> getByDocumentId(String documentId) async {
    return firestore
        .collection('todo')
        .doc(documentId)
        .snapshots()
        .map((doc) => ListModel.fromDocument(doc));
  }

  @override
  Future save(ListModel model) async {
    var total =
        (await FirebaseFirestore.instance.collection('todo').get()).docs.length;

    if (model.reference == null) {
      model.reference =
          await FirebaseFirestore.instance.collection('todo').add({
        'title': model.title,
        'position': total,
      });
    } else {
      model.reference.update({
        'title': model.title,
      });
    }
  }

  Future delete(ListModel model) {
    return model.reference.delete();
  }
}
