import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/home/repositories/interfaces/todo_repository_interface.dart';
import 'package:listacompra/app/modules/home/repositories/todo_repository.dart';
import 'package:listacompra/app/modules/home/services/interfaces/todo_service_interfaces.dart';
import 'package:listacompra/app/modules/home/services/todo_service.dart';

import 'item/item_module.dart';
import 'list_page.dart';

class ListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ITodoService>((i) => TodoService(todoRepository: i.get())),
        Bind<ITodoRepository>(
            (i) => TodoRepository(firestore: FirebaseFirestore.instance)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => ListPage()),
        ModularRouter("/item", module: ItemModule()),
      ];

  static Inject get to => Inject<ListModule>.of();
}
