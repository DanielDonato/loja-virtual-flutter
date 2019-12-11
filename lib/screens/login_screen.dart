import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:lojavirtual/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(
                fontSize: 15
              ),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUpScreen())
              );
            },
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, builder, model) {
          if(model.isLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
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
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Text(
                      "Esqueci minha senha",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(height: 0,),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
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
          );
        },
      )
    );
  }
}



