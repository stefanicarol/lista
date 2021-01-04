import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/list/services/interfaces/todo_service_interfaces.dart';
import 'package:mobx/mobx.dart';

import 'item/models/item_model.dart';
import 'models/list_model.dart';

part 'list_controller.g.dart';

@Injectable()
class ListController = _ListControllerBase with _$ListController;

abstract class _ListControllerBase with Store {
  final ITodoService todoService;

  String firebaseDoc = '';
  String firebaseCollection = '';
  ItemModel itemModel;

  @observable
  ObservableStream<List<ListModel>> todoList;

  _ListControllerBase({@required this.todoService}) {
    getList();
  }

  @action
  void getList() {
    todoList = todoService.get().asObservable();
  }

  @action
  void save(ListModel model) {
    todoService.save(model);
  }

  @action
  void delete(ListModel model) {
    todoService.delete(model);
  }
}
