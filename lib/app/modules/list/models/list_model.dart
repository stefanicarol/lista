import 'package:cloud_firestore/cloud_firestore.dart';

class ListModel {
  String title;
  DocumentReference reference;
  int position;
  int id;
  String owner;
  List share;

  ListModel({
    this.title = '',
    this.reference,
    this.id,
    this.position,
    this.owner,
    this.share,
  });

  factory ListModel.fromDocument(DocumentSnapshot doc) {
    return ListModel(
      title: doc['title'],
      reference: doc.reference,
      position: doc['position'],
      owner: doc['owner'],
      share: doc['share'],
    );
  }

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      title: json['title'],
      id: json['id'],
      owner: json['owner'],
      share: json['share'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
