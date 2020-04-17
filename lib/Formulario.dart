import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Contato.dart';

class Formulario extends StatelessWidget {

  final campoNome = TextEditingController();
  final campoEmail = TextEditingController();
  final campoTel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: campoNome,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                  icon: Icon(Icons.account_box)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: campoEmail,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  icon: Icon(Icons.email)
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: campoTel,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  icon: Icon(Icons.phone)
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            RaisedButton(
              child: Text("Enviar",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.blue,
              highlightColor: Colors.red[300],
              onPressed: () => _criaContato(context),
            )
          ],
        )
      ),
    );
  }

  void _criaContato(BuildContext context) {
    
    final String nome = campoNome.text;
    final String email = campoNome.text;
    final String tel = campoTel.text;

    if (nome != null && email != null && tel != null)
    {
      final contatoCriado = Contato(nome, email, tel);
      debugPrint('Criando transferência');
      debugPrint('$contatoCriado');
      Navigator.pop(context, contatoCriado);
    }

  }
}

