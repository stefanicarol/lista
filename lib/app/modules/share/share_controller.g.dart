// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShareController on _ShareControllerBase, Store {
  final _$todoListAtom = Atom(name: '_ShareControllerBase.todoList');

  @override
  ObservableStream<List<ListModel>> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableStream<List<ListModel>> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  final _$_ShareControllerBaseActionController =
      ActionController(name: '_ShareControllerBase');

  @override
  void getList() {
    final _$actionInfo = _$_ShareControllerBaseActionController.startAction(
        name: '_ShareControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_ShareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save(ListModel model) {
    final _$actionInfo = _$_ShareControllerBaseActionController.startAction(
        name: '_ShareControllerBase.save');
    try {
      return super.save(model);
    } finally {
      _$_ShareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(ListModel model) {
    final _$actionInfo = _$_ShareControllerBaseActionController.startAction(
        name: '_ShareControllerBase.delete');
    try {
      return super.delete(model);
    } finally {
      _$_ShareControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoList: ${todoList}
    ''';
  }
}
