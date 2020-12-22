import 'package:flutter/cupertino.dart';
import 'package:listacompra/app/modules/home/models/item_model.dart';
import 'package:listacompra/app/modules/home/services/interfaces/item_service_interfaces.dart';
import 'package:mobx/mobx.dart';

part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final IItemService itemService;

  @observable
  ObservableStream<List<ItemModel>> itemList;

  _ItemControllerBase({@required this.itemService}) {
    getList();
  }

  @action
  void getList() {
    print("hello");
    itemList = itemService.get().asObservable();
    print("ITEM ${itemList}");
  }
}
