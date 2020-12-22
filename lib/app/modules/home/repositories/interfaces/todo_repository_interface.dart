import '../../models/list_model.dart';

abstract class ITodoRepository {
  Stream<List<ListModel>> get();
  Future save(ListModel model);
  Future delete(ListModel model);
}
