import 'package:cloud_firestore/cloud_firestore.dart';

class ListModel {
  String title;
  DocumentReference reference;
  int position;
  int id;

  ListModel({
    this.title = '',
    this.reference,
    this.id,
    this.position,
  });

  factory ListModel.fromDocument(DocumentSnapshot doc) {
    return ListModel(
      title: doc['title'],
      reference: doc.reference,
      position: doc['position'],
    );
  }

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(title: json['title'], id: json['id']);
  }

  Map<String, dynamic> toJson() => {};
}
