import 'dart:async';
import 'package:flutter/material.dart';
import '../LogIn/login.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      }) );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffffffff),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(child: Image(image: AssetImage("assets/images/sb.jpg"),
            fit: BoxFit.cover),),
      ),
    );
  }
}

