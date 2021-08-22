import 'package:flutter/material.dart';
//possui todo o codigo base para utilziar o dart para usar com o flotter

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // menu de navegação
      appBar: AppBar(
        title: Text("Raxa Conta"),
        centerTitle: true,
      ),

      //corpo com scroll
      body: SingleChildScrollView(
        child: Form(
          child: (Column(
            children: <Widget>[
              // icone
              Icon(
                Icons.monetization_on,
                size: 120,
                color: Colors.blue,
              ),

              // botao para colocar a quantidade de pessoas
              TextFormField(
                keyboardType: TextInputType.number,
                //só abre teclado de numeros
                decoration: InputDecoration(
                  labelText: 'Quantidade de pessoas',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),

              // botão para colcoar a quantidade de produtos
              TextFormField(
                keyboardType: TextInputType.number,
                //só abre teclado de numeros
                decoration: InputDecoration(
                  labelText: 'Valor da conta',
                  labelStyle: TextStyle(color: Colors.blue),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),

              //botão para fazer o calculo
              RaisedButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text(
                    "Calcular",
                  )),

              // texto que retorna o resultado do calculo
              Text(
                "Valor por pessoa",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
