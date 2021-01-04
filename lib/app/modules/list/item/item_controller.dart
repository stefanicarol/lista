import 'package:flutter/material.dart';
import 'package:listacompra/app/modules/list/item/services/interface/item_service_interfaces.dart';
import 'package:mobx/mobx.dart';

import 'models/item_model.dart';

part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final IItemService itemService;

  @observable
  ObservableStream<List<ItemModel>> itemList;

  _ItemControllerBase({@required this.itemService}) {
    getList();
  }
  @observable
  int quantity = 0;

  @action
  void increment() {
    quantity++;
  }

  @action
  void decrement() {
    quantity--;
  }

  @action
  void getList() {
    itemList = itemService.get().asObservable();
  }

  @action
  void save(ItemModel model) {
    itemService.save(model);
  }

  @action
  void delete(ItemModel model) {
    itemService.delete(model);
  }
}
