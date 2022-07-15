
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/pallete.dart';
import 'package:flutterapp/widgets/card_item.dart';
import 'package:flutterapp/widgets/logout.dart';
import 'package:flutterapp/widgets/style_text_rich.dart';

class ProfilePatient extends StatefulWidget{

  @override
  State<ProfilePatient> createState() => _ProfilePatientState();
}

class _ProfilePatientState extends State<ProfilePatient>{

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)!.settings.arguments;
    print(user.dataUser);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KInfo1,
        title: Text("Receta"),
        actions: [
          Logout()
        ],
      ),
      body: ListView(
        children: [
          CardItem(
            Icons.account_box,
            KInfo2,
            text: StyleTextRich(title: "CI: ", subtitle: user.dataUser["ci"].toString(),
              fontSizeTitle: 18,
              fontSizeSubtitle: 18,
            ),
          ),
          CardItem(
            Icons.assignment_ind,
            KInfo2,
            text: StyleTextRich(title: "Nombre: ", subtitle: user.dataUser["name"],
              fontSizeTitle: 18,
              fontSizeSubtitle: 18,
            ),
          ),
          CardItem(
            Icons.mail,
            KInfo2,
            text: StyleTextRich(title: "Correo: ", subtitle: user.dataUser["email"],
              fontSizeTitle: 18,
              fontSizeSubtitle: 18,
            ),
          ),
          CardItem(
            Icons.phone,
            KInfo2,
            text: StyleTextRich(title: "Teléfono: ", subtitle: user.dataUser["phone"].toString(),
              fontSizeTitle: 18,
              fontSizeSubtitle: 18,
            ),
          ),
          CardItem(
            Icons.av_timer,
            KInfo2,
            text: StyleTextRich(title: "Nacimiento: ", subtitle: user.dataUser["fecha_nacimiento"],
              fontSizeTitle: 18,
              fontSizeSubtitle: 18,
            ),
          ),
          CardItem(
            Icons.home,
            KInfo2,
            text: StyleTextRich(title: "Dirección: ", subtitle: user.dataUser["address"],
              fontSizeTitle: 18,
              fontSizeSubtitle: 18,
            ),
          ),
        ],
      )
    );
  }

}
