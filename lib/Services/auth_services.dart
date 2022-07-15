import 'dart:convert';

import 'package:flutterapp/Services/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(
      String name, String email, String password) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<List<dynamic>?> getCitas(idUser) async {
    var url = Uri.parse(baseURL + "citas/$idUser");
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      print('petición correcta');

      final jsonData = jsonDecode(response.body);
      List<dynamic> listDatas = jsonData;
      return listDatas;
    }else{
      return null;
    }
  }

  static Future<List<dynamic>?> getRecetas(idUser) async {
    var url = Uri.parse(baseURL + "recetas/$idUser");
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      print('petición correcta');

      final jsonData = jsonDecode(response.body);
      List<dynamic> listDatas = jsonData;
      List<dynamic> newListRecetas = [];
      for (var element in listDatas) {
        newListRecetas += element;
      }
      return newListRecetas;
    }else{
      return null;
    }
  }

  static Future<List<dynamic>?> getRecetasDeCita(idCita) async {
    var url = Uri.parse(baseURL + "citas/recetas/$idCita");
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      print('petición correcta');
      final jsonData = jsonDecode(response.body);
      List<dynamic> listDatas = jsonData;
      return listDatas;
    }else{
      return null;
    }
  }
}
