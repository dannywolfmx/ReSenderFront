import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Hola mundo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Entra con tu correo y contraseña",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          textFormEmail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          textFormPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          signInButton(),
        ],
      ),
    );
  }

  TextFormField textFormEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(),
        prefixIcon: Icon(Icons.mail),
      ),
      onSaved: (value) => email = value,
    );
  }

  TextFormField textFormPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(),
        prefixIcon: Icon(Icons.mail),
      ),
      onSaved: (value) => password = value,
    );
  }

  FlatButton signInButton() {
    return FlatButton(
      color: Colors.black,
      textColor: Colors.white,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          authentificate(email, password);
        }
      },
      child: Text("Entrar"),
    );
  }

  authentificate(String email, String password) {
    String url = 'http://localhost:8080/auth/sign-up';
    http
        .post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'username': email,
        'password': password,
      }),
    )
        .then((response) {
      print(response.body);
    });
  }
}
