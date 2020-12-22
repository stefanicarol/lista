import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/home/models/item_model.dart';

import 'interfaces/item_repository_interface.dart';

class ItemRepository extends Disposable implements IItemRepository {
  final FirebaseFirestore firestore;
  final ItemModel model;

  ItemRepository({@required this.model, this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Stream<List<ItemModel>> get() {
    return FirebaseFirestore.instance
        .collection('todo')
        .doc(model.listModel.reference.id)
        .collection(model.title)
        .orderBy('status', descending: false)
        .snapshots()
        .map((query) =>
            query.docs.map((doc) => ItemModel.fromDocument(doc)).toList());
  }

  @override
  Future<Stream<ItemModel>> getByDocumentId(String documentId) async {
    return firestore
        .collection('todo')
        .doc(model.listModel.reference.id)
        .collection(model.title)
        .doc()
        .snapshots()
        .map((doc) => ItemModel.fromDocument(doc));
  }

  @override
  Future save(ItemModel model) async {
    var total = (await FirebaseFirestore.instance
            .collection('todo')
            .doc(model.listModel.reference.id)
            .collection(model.title)
            .get())
        .docs
        .length;

    if (model.reference == null) {
      model.reference = await FirebaseFirestore.instance
          .collection('todo')
          .doc(model.listModel.reference.id)
          .collection(model.title)
          .add({
        'title': model.title,
        'position': total,
        'status': model.status,
        'quantidade': model.quantidade,
      });
    } else {
      model.reference.update({
        'title': model.title,
        'status': model.status,
        'quantidade': model.quantidade,
      });
    }
  }

  Future delete(ItemModel model) {
    return model.reference.delete();
  }
}
