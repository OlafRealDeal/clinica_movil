import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/patient/index.dart';
import 'package:flutterapp/Screens/patient/profile.dart';
import 'package:flutterapp/Screens/patient/report/cita.dart';
import 'package:flutterapp/Screens/patient/report/receta.dart';
import 'package:flutterapp/Screens/welcome.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomePage(),
      initialRoute: "index",
      routes: {
        "index": (context) => WelcomePage(),
        "patient.index": (context) => IndexPatient(),
        "patient.profile": (context) => ProfilePatient(),
        "patient.receta": (context) => RecetaPatient(),
        "patient.cita":(context) => CitaPatient()
      },
    );
  }
}
