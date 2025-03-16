import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  ScreenUtilInit (
      designSize: const Size(390, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, build){
        return GetMaterialApp(
          title: 'RETINA APP',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(17, 17, 16, 1.0)
              )
          )
        );
      },
      child: SplashScreen() ,
    );
  }
}

