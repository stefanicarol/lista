import 'package:listacompra/app/modules/home/models/list_model.dart';

abstract class ITodoService {
  Stream<List<ListModel>> get();
  Future save(ListModel model);
  Future delete(ListModel model);
}
