import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/list/item/models/item_model.dart';
import 'package:listacompra/app/modules/list/list_controller.dart';
import 'interfaces/item_repository_interface.dart';

class ItemRepository extends Disposable implements IItemRepository {
  final FirebaseFirestore firestore;
  final homeController = Modular.get<ListController>();

  ItemRepository({this.firestore});

  @override
  void dispose() {}

  @override
  Stream<List<ItemModel>> get() {
    return FirebaseFirestore.instance
        .collection('todo')
        .doc(homeController.firebaseCollection)
        .collection(homeController.firebaseCollection)
        .orderBy('status', descending: false)
        .snapshots()
        .map((query) =>
            query.docs.map((doc) => ItemModel.fromDocument(doc)).toList());
  }

  @override
  Future<Stream<ItemModel>> getByDocumentId(String documentId) async {
    return firestore
        .collection('todo')
        .doc(homeController.firebaseCollection)
        .snapshots()
        .map((doc) => ItemModel.fromDocument(doc));
  }

  @override
  Future save(ItemModel model) async {
    var total = (await FirebaseFirestore.instance
            .collection('todo')
            .doc(homeController.firebaseCollection)
            .collection(homeController.firebaseCollection)
            .get())
        .docs
        .length;
    if (model.reference == null) {
      model.reference = await FirebaseFirestore.instance
          .collection('todo')
          .doc(homeController.firebaseCollection)
          .collection(homeController.firebaseCollection)
          .add({
        'title': model.title,
        'position': total,
        'quantity': model.quantity,
        'status': model.status,
      });
    } else {
      model.reference.update({
        'title': model.title,
        'quantity': model.quantity,
        'status': model.status,
      });
    }
  }

  Future delete(ItemModel model) {
    return model.reference.delete();
  }
}
