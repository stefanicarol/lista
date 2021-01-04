import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/list/item/models/item_model.dart';
import 'package:listacompra/app/modules/list/item/repositories/interfaces/item_repository_interface.dart';
import 'interface/item_service_interfaces.dart';

@Injectable()
class ItemService extends Disposable implements IItemService {
  //dispose will be called automatically
  @override
  void dispose() {}

  final IItemRepository itemRepository;
  ItemService({@required this.itemRepository});

  @override
  Stream<List<ItemModel>> get() {
    return itemRepository.get();
  }

  @override
  Future delete(ItemModel model) {
    return itemRepository.delete(model);
  }

  @override
  Future save(ItemModel model) {
    return itemRepository.save(model);
  }
}
