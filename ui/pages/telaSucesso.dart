import 'package:flutter/material.dart';
import 'package:cadastro/ui/widgets/myAppBar.dart';

class TelaSucesso extends StatelessWidget {
  const TelaSucesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: "Lista de atividades para fazer"),
      body: ListaAtividades(),
    );
  }
}

class Atividade {
  String nome;
  bool estudada;

  Atividade(this.nome, this.estudada);
}

class ListaAtividades extends StatefulWidget {
  @override
  _ListaAtividadesState createState() => _ListaAtividadesState();
}

class _ListaAtividadesState extends State<ListaAtividades> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _editController = TextEditingController();
  List<Atividade> atividades = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Nova atividade",
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    atividades.add(Atividade(_controller.text, false));
                    _controller.clear();
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: atividades.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    Checkbox(
                      value: atividades[index].estudada,
                      onChanged: (value) {
                        setState(() {
                          atividades[index].estudada = value!;
                        });
                      },
                    ),
                    Expanded(child: Text(atividades[index].nome)),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editController.text = atividades[index].nome;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Editar atividade"),
                              content: TextField(
                                controller: _editController,
                                decoration:
                                    InputDecoration(hintText: "Novo nome"),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      atividades[index].nome =
                                          _editController.text;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Text('Salvar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancelar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          atividades.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
