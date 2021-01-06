import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/list/repositories/interfaces/todo_repository_interface.dart';
import 'package:listacompra/app/modules/list/repositories/todo_repository.dart';
import 'package:listacompra/app/modules/list/services/interfaces/todo_service_interfaces.dart';
import 'package:listacompra/app/modules/list/services/todo_service.dart';

import 'share_controller.dart';
import 'share_page.dart';

class ShareModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ITodoService>((i) => TodoService(todoRepository: i.get())),
        Bind<ITodoRepository>(
            (i) => TodoRepository(firestore: FirebaseFirestore.instance)),
        Bind((i) => ShareController()),
        Bind<ITodoService>((i) => TodoService(todoRepository: i.get())),
        Bind((i) => ShareController(todoService: i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => SharePage()),
      ];

  static Inject get to => Inject<ShareModule>.of();
}
