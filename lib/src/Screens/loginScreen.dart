import 'package:flutter/material.dart';
import '../Mixins/validationMixins.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: 15.0)),
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Correo', hintText: 'you@example.com'),
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Clave', hintText: 'Clave'),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
        onPressed: () {
          //formKey.currentState.reset();
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            //print('Time to post $email and $password to API');
            final snackBar = SnackBar(
              content: Text('Email y Clave validados..'),
              duration: Duration(milliseconds: 550),
            );

            Scaffold.of(context).showSnackBar(snackBar);
          }
        },
        child: Text('Ingresar'),
        color: Colors.blue[100]);
  }
}
