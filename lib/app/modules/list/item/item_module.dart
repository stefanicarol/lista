import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/list/item/item_page.dart';

import 'item_controller.dart';

class ItemModule extends ChildModule {
  List<Bind> get binds => [
        Bind((i) => ItemController()),
        //   Bind<IItemRepository>(
        //     (i) => ItemRepository(firestore: FirebaseFirestore.instance)),
        //    Bind<IItemService>((i) => ItemService(itemRepository: i.get())),
        // Bind((i) => ItemController(itemService: i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/:nome",
            child: (_, args) => ItemPage(
                  title: args.params["nome"],
                )),
      ];

  static Inject get to => Inject<ItemModule>.of();
}
