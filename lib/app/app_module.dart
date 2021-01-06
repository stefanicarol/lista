import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/app_widget.dart';
import 'package:listacompra/app/modules/list/item/item_module.dart';
import 'package:listacompra/app/shared/auth/auth_controller.dart';
import 'package:listacompra/app/shared/auth/repositories/auth_repository.dart';
import 'package:listacompra/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:listacompra/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:listacompra/app/shared/repositories/localstorage/local_storage_share.dart';
import 'package:listacompra/app/splash/splash_page.dart';

import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/list/list_module.dart';
import 'modules/login/login_module.dart';
import 'modules/share/share_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<ILocalStorage>((i) => LocalStorageShared()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashPage()),
        ModularRouter('/login',
            module: LoginModule(), transition: TransitionType.noTransition),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter("/list", module: ListModule()),
        ModularRouter("/item", module: ItemModule()),
        ModularRouter("/share", module: ShareModule()),
        //ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
