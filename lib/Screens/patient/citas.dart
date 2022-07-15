

import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/shared_preferences.dart';
import 'package:flutterapp/widgets/style_text_rich.dart';

class CitasPatient extends StatefulWidget {

  @override
  State<CitasPatient> createState() => _CitasPatientState();

}

class _CitasPatientState extends State<CitasPatient> {
  
  List<String> listRecetas = [
    "Cita 1",
    "Cita 2",
    "Cita 3",
    "Cita 4",
    "Cita 5",
    "Cita 6",
    "Cita 7",
    "Cita 8",
  ];

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)!.settings.arguments;
    print(user.dataUser);
    return Scaffold(
      body: FutureBuilder(
        future: AuthServices.getCitas(user.dataUser["id"]),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                String descriptionAux;
                if(snapshot.data[index]["description"].length >= 36) {
                  descriptionAux = snapshot.data[index]["description"].substring(0, 36) + "...";
                } else {
                  descriptionAux = snapshot.data[index]["description"];
                }
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "patient.cita", arguments: snapshot.data[index]);
                    },
                    child: Card(
                      elevation: 6,
                      color: Colors.white70,
                      child: ListTile(
                        leading: const Icon(Icons.assignment),
                        title: StyleTextRich(
                          title: "Descripción: ",
                          fontSizeTitle: 18,
                          subtitle: snapshot.data[index]["description"],
                          fontSizeSubtitle: 18,
                        ),
                        subtitle: StyleTextRich(
                          title: "Fecha: ",
                          fontSizeTitle: 18,
                          subtitle: snapshot.data[index]["fecha_hora"],
                          fontSizeSubtitle: 18,
                        ),
                      )
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

}