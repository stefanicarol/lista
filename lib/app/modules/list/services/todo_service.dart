import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/list/repositories/interfaces/todo_repository_interface.dart';

import '../models/list_model.dart';
import 'interfaces/todo_service_interfaces.dart';

@Injectable()
class TodoService extends Disposable implements ITodoService {
  //dispose will be called automatically
  @override
  void dispose() {}

  final ITodoRepository todoRepository;
  TodoService({@required this.todoRepository});

  @override
  Stream<List<ListModel>> get() {
    return todoRepository.get();
  }

  @override
  Future delete(ListModel model) {
    return todoRepository.delete(model);
  }

  @override
  Future save(ListModel model) {
    return todoRepository.save(model);
  }

  @override
  Future share(ListModel model) {
    return todoRepository.share(model);
  }
}
