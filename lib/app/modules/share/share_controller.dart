import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/list/item/models/item_model.dart';
import 'package:listacompra/app/modules/list/models/list_model.dart';
import 'package:listacompra/app/modules/list/services/interfaces/todo_service_interfaces.dart';
import 'package:mobx/mobx.dart';

part 'share_controller.g.dart';

@Injectable()
class ShareController = _ShareControllerBase with _$ShareController;

abstract class _ShareControllerBase with Store {
  final ITodoService todoService;

  String firebaseDoc = '';
  String firebaseCollection = '';
  ItemModel itemModel;

  @observable
  ObservableStream<List<ListModel>> todoList;

  _ShareControllerBase({@required this.todoService}) {
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
