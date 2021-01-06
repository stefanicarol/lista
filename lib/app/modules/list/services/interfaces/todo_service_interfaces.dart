import 'package:listacompra/app/modules/list/models/list_model.dart';

abstract class ITodoService {
  Stream<List<ListModel>> get();
  Future save(ListModel model);
  Future share(ListModel model);
  Future delete(ListModel model);
}
