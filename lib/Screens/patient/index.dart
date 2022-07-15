
import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/patient/citas.dart';
import 'package:flutterapp/Screens/patient/recetas.dart';
import 'package:flutterapp/Services/shared_preferences.dart';
import 'package:flutterapp/utils/pallete.dart';
import 'package:flutterapp/widgets/logout.dart';
import 'package:flutterapp/widgets/style_text_rich.dart';


class IndexPatient extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _IndexPatientState();

}

class _IndexPatientState extends State<IndexPatient>{


  TextEditingController _search = TextEditingController();
  
  DateTime _selectedDate = DateTime.now();

  int _optionSelected = 0;
  final List<Widget> pages = [
    CitasPatient(),
    RecetasPatient(),
  ];
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KInfo1,
        actions: [
          Logout(),
          IconButton(
            icon: Icon(Icons.filter_list_outlined),
            onPressed: () async {
              await _selectDate(context);
              print(_selectedDate.toString());
            },
          )
        ],
      ),
      drawer: _drawer(user),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _drawer(user) {
    return Drawer(
      elevation: 8,
      width: 250,
      backgroundColor: KInfo1,
      child: ListView(
        children: [
            Padding(
            padding: EdgeInsets.all(8.0),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: KInfo2
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StyleTextRich(
                      title: "Clinic Center",
                      fontSizeTitle: 30,
                    ),
                    StyleTextRich(
                      title: "Correo: ",
                      subtitle: "clinicCenter@gmail.com",
                    )
                  ],
                ),
              )
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.arrow_right),
                title: StyleTextRich(
                  title: "Perfil",
                  fontSizeTitle: 18,
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'patient.profile', arguments: user);
                  print("Perfil");
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.arrow_right),
                title: StyleTextRich(
                  title: "Acerca de",
                  fontSizeTitle: 18,
                ),
                onTap: () {
                  print("Acerca de");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
          child: TextField(
            onChanged: (value) {
              print(_search.text);
            },
            controller: _search,
            decoration: const InputDecoration(
                labelText: "Buscar",
                hintText: "Buscar por nombre",
                
                labelStyle: TextStyle(
                  color: KInfo1
                ),
                prefixIcon: Icon(Icons.search, color: KInfo1,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                    
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(width: 2,color: KInfo1),
                ),
            ),
          ),
        ),
        Expanded(
          child: pages.elementAt(_optionSelected)
        ),
      ],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note),
          label: 'Citas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Recetas',
        )
      ],
      currentIndex: _optionSelected,
      selectedItemColor: KInfo2,
      onTap: (value) {
        setState(() {
          _optionSelected = value;
        });
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        locale: const Locale('en', 'eng'),
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (context, child){
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: KInfo1, // header background color
                onPrimary: Colors.black, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: KInfo1, // button text color
                ),
              ),
            ),
            child: child!,
          );
        }
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

}
