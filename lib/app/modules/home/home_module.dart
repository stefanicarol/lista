import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/home/home_controller.dart';
import 'package:listacompra/app/modules/list/list_controller.dart';
import 'package:listacompra/app/modules/list/list_module.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => ListController(todoService: i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter("/list", module: ListModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
