import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Nome Completo"
              ),
              validator: (text) {
                if(text.isEmpty){
                  return "Nome invalido!";
                }
                return null;
              },
            ),
            SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Email"
              ),
              validator: (text) {
                if(text.isEmpty || !text.contains("@")){
                  return "Email invalido!";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
              validator: (text) {
                if(text.isEmpty || text.length < 6){
                  return "Senha Invalida!";
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Endereco"
              ),
              validator: (text) {
                if(text.isEmpty){
                  return "Endereco invalido!";
                }
                return null;
              },
            ),
            SizedBox(height: 16,),
            SizedBox(
              height: 44,
              child: RaisedButton(
                child: Text(
                  "Criar Conta",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if(_formKey.currentState.validate()) {

                  }
                },
              ),
            )
          ],
        ),
      ),
    );

  }
}

