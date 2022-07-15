
import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/shared_preferences.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Icon(Icons.logout),
        onTap: () async {
          Navigator.of(context).pushNamedAndRemoveUntil('index', (Route<dynamic> route) => false);
        },
      ),
    );
  }


}