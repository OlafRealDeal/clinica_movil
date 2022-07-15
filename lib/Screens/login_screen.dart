import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:flutterapp/Services/shared_preferences.dart';
import 'package:flutterapp/data/user.dart';
import 'package:flutterapp/widgets/rounded_button.dart';
import 'package:http/http.dart' as http;

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {

        Navigator.pushNamed(context, 'patient.index', arguments: User(dataUser: {          
          "id": responseMap["user"]["id"],
          "name": responseMap["user"]["name"],
          "ci": responseMap["user"]["ci"],
          "address": responseMap["user"]["address"],
          "phone": responseMap["user"]["phone"],
          "email": responseMap["user"]["email"],
          "fecha_nacimiento": responseMap["user"]["fecha_nacimiento"],
        
        }));
        
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Ingresar email',
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Ingresar contraseña',
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                btnText: 'Iniciar Sesion',
                onBtnPressed: () => loginPressed(),
              )
            ],
          ),
        ));
  }
}
