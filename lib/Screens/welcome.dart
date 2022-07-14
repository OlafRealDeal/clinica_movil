import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/splash.dart';
import 'package:flutterapp/Screens/login_screen.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  'assets/imgs/clinicCenter.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50,),
                  const Text('Bienvenidos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  
                  const SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: FlatButton(
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashPage(duration: 4, goToPage: LoginScreen()),
                      ),
                    );
                  },
                                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      color: (Colors.cyan),
                      padding: const EdgeInsets.all(25),
                      child: const Text('Iniciar',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                    const Text('Santa Cruz - Bolivia',
                    textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 18,
                   ),
                  ), 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}