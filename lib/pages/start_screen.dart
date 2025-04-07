import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Color.fromRGBO(17, 17, 16, 1.0),
          systemNavigationBarColor: Color.fromRGBO(192, 192, 192, 1),
          systemNavigationBarDividerColor: Color.fromRGBO(17, 17, 16, 1.0),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(17, 17, 16, 1.0),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/image/aset_bg_round_kanan.png",
                    width: 200.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 40.w, top: 90.h, right: 50.w, bottom: 50.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/image/logo_retina_datar_white.png",
                        width: 150.w),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Kenali Dunia dengan Cara Baru",
                      style: TextStyle(
                          fontFamily: "Hammersmith",
                          fontSize: 60.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Teknologi assistive yang membawa Anda lebih dekat dengan dunia. RETINA membantu Anda mengenali lingkungan sekitar, memahami objek, dan berinteraksi dengan lebih mandiri. Mari melangkah lebih jauh bersama RETINA!",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ButtonTemplate(context, () {
                      Navigator.pushNamed(context, '/menu_screen');
                      // Navigator.pushReplacementNamed(context, '/menu_screen');
                    },
                        text: "Mulai Sekarang",
                        height_percent: 0.07,
                        radius: 50.dm)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
