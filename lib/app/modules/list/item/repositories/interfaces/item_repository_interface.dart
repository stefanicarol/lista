import 'package:listacompra/app/modules/list/item/models/item_model.dart';

abstract class IItemRepository {
  Stream<List<ItemModel>> get();
  Future save(ItemModel model);
  Future delete(ItemModel model);
}
