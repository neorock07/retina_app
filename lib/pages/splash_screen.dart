import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 17, 16, 1.0),
      body: Stack(
        children: [
          Center(
            child: Image.asset("assets/image/logo.png"),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset("assets/image/aset_bg_2 2.png"),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/image/aset_bg_2 1.png"),
          ),
        ],
      )
    );
  }
}