import 'package:cloud_firestore/cloud_firestore.dart';

import 'list_model.dart';

class ItemModel {
  ListModel listModel;
  String title;
  DocumentReference reference;
  int position;
  int id;
  bool status;
  int quantidade;

  ItemModel(
      {this.listModel,
      this.title = '',
      this.reference,
      this.id,
      this.position,
      this.quantidade,
      this.status});

  factory ItemModel.fromDocument(DocumentSnapshot doc) {
    return ItemModel(
      listModel: doc['listModel'],
      title: doc['title'],
      quantidade: doc['quantidade'],
      status: doc['status'],
      reference: doc.reference,
      position: doc['position'],
    );
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
        listModel: json['listModel'],
        title: json['title'],
        id: json['id'],
        quantidade: json['quantidade'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() => {};
}
