

import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/widgets/style_text_rich.dart';

class RecetasPatient extends StatefulWidget {

  @override
  State<RecetasPatient> createState() => _RecetasPatientState();

}

class _RecetasPatientState extends State<RecetasPatient> {
  
  List<String> listRecetas = [
    "Receta 1",
    "Receta 2",
    "Receta 3",
    "Receta 4",
    "Receta 5",
    "Receta 6",
    "Receta 7",
    "Receta 8",
  ];

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)!.settings.arguments;
    
    return Scaffold(
      body: FutureBuilder(
        future: AuthServices.getRecetas(user.dataUser["id"]),
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
                      Navigator.pushNamed(context, "patient.receta", arguments: snapshot.data[index]);
                    },
                    child: Card(
                      elevation: 6,
                      color: Colors.white70,
                      child: ListTile(
                        leading: const Icon(Icons.assignment),
                        title: StyleTextRich(
                          title: "Descripción: ",
                          fontSizeTitle: 18,
                          subtitle: descriptionAux,
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
          }else {
            return Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }

}