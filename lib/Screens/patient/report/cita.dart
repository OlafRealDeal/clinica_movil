
import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/widgets/rounded_button.dart';
import 'package:flutterapp/utils/pallete.dart';
import 'package:flutterapp/widgets/logout.dart';
import 'package:flutterapp/widgets/style_text_rich.dart';

class CitaPatient extends StatefulWidget{

  @override
  State<CitaPatient> createState() => _CitaPatientState();
}

class _CitaPatientState extends State<CitaPatient>{

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)!.settings.arguments;
    print(user);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KInfo1,
        title: const Text("Cita"),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    height: 60,
                    child: FutureBuilder(
                      future: AuthServices.getRecetasDeCita(user['id']),
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if(snapshot.hasData){
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: _chips(snapshot.data, index)
                              );
                            },
                          );
                        }else{
                          return Center(child: CircularProgressIndicator(),);
                        }
                      }
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  _chips(List servi, i){
    return FilterChip(
      label: Text(
        servi[i]["fecha_hora"],
        style: TextStyle(color: Colors.white),
      ),
      elevation: 10,
      pressElevation: 5,
      backgroundColor: KInfo2,
      onSelected: (bool selected) {
        setState(() {
          print(servi[i]);
        });
      },
    );
  }

}