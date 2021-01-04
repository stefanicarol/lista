import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String title;
  DocumentReference reference;
  int position;
  int id;
  int quantity;
  bool status;

  ItemModel({
    this.title = '',
    this.reference,
    this.id,
    this.position,
    this.quantity,
    this.status = false,
  });

  factory ItemModel.fromDocument(DocumentSnapshot doc) {
    return ItemModel(
      title: doc['title'],
      reference: doc.reference,
      position: doc['position'],
      quantity: doc['quantity'],
      status: doc['status'],
    );
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      title: json['title'],
      id: json['id'],
      quantity: json['quantity'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
