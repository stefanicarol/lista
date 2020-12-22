import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/home/models/list_model.dart';

import 'list_controller.dart';

class ListPage extends StatefulWidget {
  final String title;

  const ListPage({Key key, this.title = "Lista Compartilhada"})
      : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends ModularState<ListPage, ListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _addFirebase(),
          Expanded(
            child: Observer(builder: (_) {
              if (controller.todoList.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.todoList.hasError) {
                return Center(
                  child: RaisedButton(
                    onPressed: controller.getList,
                    child: Text('Error'),
                  ),
                );
              } else if (controller.todoList.data.length == 0) {
                return Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_shopping_cart),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Nenhum item cadastrado nesta lista '),
                    ],
                  ),
                );
              } else {
                List<ListModel> list = controller.todoList.data;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      var model = list[index];
                      return Dismissible(
                        key: Key(
                            DateTime.now().millisecondsSinceEpoch.toString()),
                        background: Container(
                          color: Colors.red,
                          child: Align(
                            alignment: Alignment(-0.9, 0.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        direction: DismissDirection.startToEnd,
                        child: ListTile(
                          onTap: () {
                            print(model.title);
                            print(model.reference.id);

                            // _showDialog(model: model);
                          },
                          title: Text(model.title),
                          leading: IconButton(
                            icon: Icon(
                              Icons.library_books,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              print(model.title);
                              _showDialog(model: model);
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              print(model.title);
                              Modular.to.pushNamed("/list/item/${model.title}");
                            },
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            controller.delete(model);
                            final snack = SnackBar(
                              content: Text("${model.title} foi removido!"),
                              duration: Duration(seconds: 2),
                            );
                            Scaffold.of(context).showSnackBar(snack);
                          });
                        },
                      );
                    });
              }
            }),
          ),
        ],
      ),
    );
  }

  _showDialog({ListModel model}) {
    model ??= ListModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(model.reference == null ? 'Adicionar' : 'Editar'),
            content: TextFormField(
              initialValue: model.title,
              onChanged: (v) => model.title = v,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lista: ',
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  controller.save(model);
                  Modular.to.pop();
                },
                child: Text('Salvar'),
              ),
            ],
          );
        });
  }

  _addFirebase({ListModel model}) {
    final _itemController = TextEditingController();

    void _reset() {
      setState(() {
        _itemController.text = '';
      });
    }

    model ??= ListModel();
    return Container(
      padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _itemController,
              /*initialValue: model.title,
                onChanged: (v) => model.title = v,*/
              decoration: InputDecoration(
                labelText: 'Nova Lista',
                labelStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              model.title = _itemController.text;
              controller.save(model);
              _reset();
            },
            color: Colors.deepPurple,
            child: Text(
              'ADD',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
