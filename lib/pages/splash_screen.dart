import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Future.delayed(const Duration(seconds: 3), () {
      // prefController.cekLogin(context);
      Navigator.pushReplacementNamed(context, '/start_screen');
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(17, 17, 16, 1.0),
            body: Stack(
              children: [
                Center(
                  child: Image.asset(
                    "assets/image/logo.png",
                    width: 120.w,
                  ),
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
            )));
  }
}
