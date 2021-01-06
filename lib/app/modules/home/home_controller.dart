import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/shared/auth/auth_controller.dart';
import 'package:listacompra/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ILocalStorage storage = Modular.get();
  AuthController auth = Modular.get();

  logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/login');
  }
}
