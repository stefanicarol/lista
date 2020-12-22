import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listacompra/app/modules/home/models/item_model.dart';

import 'item_controller.dart';

class ItemPage extends StatefulWidget {
  final String title;
  ItemModel itemModel;

  ItemPage({@required this.title});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends ModularState<ItemPage, ItemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Itens da Lista ${widget.title}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Observer(builder: (_) {
        List<ItemModel> list = controller.itemList.data;
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              ItemModel model = list[index];
              return ListTile(
                title: Text(model.title),
                subtitle: Text("ID: ${model.reference.id}"),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        // onPressed: _showDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
