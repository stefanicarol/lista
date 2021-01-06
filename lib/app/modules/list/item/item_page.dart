import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/list/item/item_controller.dart';
import 'package:listacompra/app/modules/list/list_controller.dart';

import 'models/item_model.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends ModularState<ItemPage, ItemController> {
  final homeController = Modular.get<ListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Itens: ${homeController.firebaseDoc} ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          _addFirebase(),
          Expanded(
            child: Observer(builder: (_) {
              if (controller.itemList.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.itemList.hasError) {
                return Center(
                  child: RaisedButton(
                    onPressed: controller.getList,
                    child: Text('Error'),
                  ),
                );
              } else if (controller.itemList.data.length == 0) {
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
                List<ItemModel> list = controller.itemList.data;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      ItemModel model = list[index];
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
                            _showDialog(model: model);
                          },
                          title: Text(model.title),
                          subtitle: Text("Quantidade: ${model.quantity}"),
                          leading: CircleAvatar(
                            backgroundColor:
                                model.status ? Colors.green : Colors.red,
                            child:
                                Icon(model.status ? Icons.check : Icons.error),
                          ),
                          trailing: Checkbox(
                            value: model.status,
                            onChanged: (c) {
                              model.status = c;
                              controller.save(model);
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

  _showDialog({ItemModel model}) {
    model ??= ItemModel();
    controller.quantity = model.quantity;
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
                labelText: 'Item: ',
              ),
            ),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (controller.quantity > 0) {
                          controller.decrement();
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Observer(
                      builder: (_) => Text(
                        "${controller.quantity}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.increment();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  model.quantity = controller.quantity;
                  controller.save(model);
                  controller.quantity = 0;
                  Modular.to.pop();
                },
                child: Text('Salvar'),
              ),
            ],
          );
        });
  }

  _addFirebase({ItemModel model}) {
    final _itemController = TextEditingController();

    void _reset() {
      setState(() {
        _itemController.text = '';
      });
    }

    model ??= ItemModel();
    return Container(
      padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _itemController,
              decoration: InputDecoration(
                labelText: 'Novo Item',
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
            ),
          ),
          _addQuantity(),
          RaisedButton(
            onPressed: () {
              model.title = _itemController.text;
              model.quantity = controller.quantity;
              controller.save(model);
              _reset();
            },
            color: Colors.blueGrey,
            child: Text(
              'ADD',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _addQuantity() {
    return Container(
      padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (controller.quantity > 0) {
                controller.decrement();
              }
            },
            icon: Icon(
              Icons.remove,
              color: Colors.blueGrey,
            ),
          ),
          Observer(
            builder: (_) => Text(
              "${controller.quantity}",
              style: TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.increment();
            },
            icon: Icon(
              Icons.add,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
