
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/pallete.dart';
import 'package:flutterapp/widgets/logout.dart';
import 'package:flutterapp/widgets/style_text_rich.dart';

class RecetaPatient extends StatefulWidget{

  @override
  State<RecetaPatient> createState() => _RecetaPatientState();
}

class _RecetaPatientState extends State<RecetaPatient>{

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)!.settings.arguments;
    print(user);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: KInfo1,
        title: const Text("Receta"),
        actions: [
          Logout()
        ],
      ),
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            color: kGreen1,
            child: Column(
              children: [
                // ListTile(
                //   leading: const Icon(Icons.assignment, color: kWhite),
                //   title: StyleTextRich(
                //     title: "Doctor: ",
                //     fontSizeTitle: 18,
                //     subtitle: "Joaquin Chumacero",
                //     fontSizeSubtitle: 18,
                //   ),
                    
                //   subtitle: Padding(
                //     padding: const EdgeInsets.only(top: 8.0),
                //     child: StyleTextRich(
                //       title: "Especialidad: ",
                //       fontSizeTitle: 18,
                //       subtitle: "Dentista",
                //       fontSizeSubtitle: 18,
                //     ),
                //   )
                // ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 8,
                    color: Color.fromARGB(255, 169, 148, 190),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // StyleTextRich(
                          //   title: "Nombre cita: ",
                          //   fontSizeTitle: 18,                        
                          // ),
                          // const SizedBox(height: 8,),
                          // StyleTextRich(
                          //   subtitle: "Revisión de los dientes",
                          //   fontSizeSubtitle: 16,
                          // ),
                          const SizedBox(height: 20,),
                          StyleTextRich(
                            title: "Descripción: ",
                            fontSizeTitle: 18,                        
                          ),
                          const SizedBox(height: 8,),
                          StyleTextRich(
                            subtitle: user["description"],
                            fontSizeSubtitle: 16,
                          )
                        ],
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: StyleTextRich(
                  title: "Fecha: ",
                  fontSizeTitle: 18,
                  subtitle: user["fecha_hora"],
                  fontSizeSubtitle: 18,
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }

}