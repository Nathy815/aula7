import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Contato.dart';
import 'ItemContato.dart';
import 'Formulario.dart';

class ListaContato extends StatefulWidget {
  
  final List<Contato> _contatos = List();

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContato> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (context, index) {
          final contato = widget._contatos[index];
          return ItemContato(contato);
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Contato> future = 
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Formulario();
            }));
            future.then((contatoRecebido) {
              debugPrint('chegou no then do future');
              debugPrint('$contatoRecebido');
              widget._contatos.add(contatoRecebido);
            });
        },
      ),
    );
  }
}