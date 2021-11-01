import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController quantidadePessoasController = TextEditingController();
  TextEditingController valorPessoasController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _valorPessoa = "Informe seus dados";

  void _calcular() {
    double quantidadePessoas = double.parse(quantidadePessoasController.text);
    double valorConta = double.parse(valorPessoasController.text);
    double valorDividido = valorConta / quantidadePessoas;
    setState(() {
      _valorPessoa =
          "Valor por pessoa: R\$ ${valorDividido.toStringAsPrecision(3)}";
    });
  }

  void _limparCampos() {
    setState(() {
      _valorPessoa = "Informe seus dados";
      quantidadePessoasController.text = "";
      valorPessoasController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raxa Conta'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _limparCampos();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.monetization_on,
                size: 120,
                color: Colors.blue,
              ),
              TextFormField(
                controller: quantidadePessoasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Quantidade de pessoas',
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 18),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira a quantidade de pessoas";
                  }
                },
              ),
              TextFormField(
                controller: valorPessoasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Valor da conta',
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 18),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "insira o valor da conta";
                  }
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _calcular();
                          valorPessoasController.clear();
                          quantidadePessoasController.clear();
                        }
                      },
                      color: Colors.blue,
                      child: Text(
                        'Calcular',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )),
              Text(_valorPessoa,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 18))
            ],
          ),
        ),
      )),
    );
  }
}
