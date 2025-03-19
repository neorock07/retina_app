import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retina_app/pages/splash_screen.dart';

/*
* 
Class untuk route page
*/
class Routers {
  static Route<dynamic> generatedRoute(RouteSettings settings){
    switch(settings.name){
      case "/splash":
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      default:
        return _errorRoute();
    }    
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        body: Center(
          child: Text("Error 404, page not found!", style: TextStyle(
            color: Colors.grey, 
            fontSize: 20.sp
          ),),
        )
      );
    });
  }

}