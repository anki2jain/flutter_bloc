import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Bloc();
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(50.0),
        children: <Widget>[
          StreamBuilder<String>(
            stream: bloc.email,
            builder: (context, snapshot) => TextField(
              onChanged:bloc.emailchanged,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter email",
                  errorText: snapshot.error),
            ),
          ),
          StreamBuilder<String>(
            stream: bloc.password,
            builder: (context, snapshot) => TextField(
              keyboardType: TextInputType.numberWithOptions(),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly
              ],
              onChanged:   bloc.passwordchanged,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  errorText: snapshot.error),
            ),
          ),

          StreamBuilder<bool>(
            stream:bloc.submitCheck,
            builder: (context,snapshot){
              return MaterialButton(onPressed: snapshot.hasData?(){
                print("Working");
              }:(){
                print("not working");
              },
              child: Text("Submit"),
            
              
              );
            },

          
      )
        ],
      ),
    );
  }
}
