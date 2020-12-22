import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/home/models/item_model.dart';
import 'package:listacompra/app/modules/home/repositories/interfaces/item_repository_interface.dart';

import 'interfaces/item_service_interfaces.dart';

@Injectable()
class ItemService extends Disposable implements IItemService {
  //dispose will be called automatically
  @override
  void dispose() {}

  final IItemRepository itemRepository;
  ItemService({@required this.itemRepository});

  @override
  Future delete(ItemModel model) {
    return itemRepository.delete(model);
  }

  @override
  Stream<List<ItemModel>> get() {
    print('Dentro SERV');
    return itemRepository.get();
  }

  @override
  Future save(ItemModel model) {
    return itemRepository.save(model);
  }
}
