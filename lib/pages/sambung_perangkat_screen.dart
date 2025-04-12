import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class SambungPerangkatScreen extends StatefulWidget {
  const SambungPerangkatScreen({Key? key}) : super(key: key);

  @override
  _SambungPerangkatScreenState createState() => _SambungPerangkatScreenState();
}

class _SambungPerangkatScreenState extends State<SambungPerangkatScreen> {
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
                    left: 40.w, top: 90.h, right: 40.w, bottom: 50.h),
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
                      "Sambungkan Handphone dengan Perangkat",
                      style: TextStyle(
                          fontFamily: "Hammersmith",
                          fontSize: 48.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Anda wajib menyambungkan Handphone ini dengan RETINA melalui Bluetooth, agar dapat menghubungkan dengan Wi-Fi Anda.",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ButtonTemplate(context, () {
                      // Navigator.pushNamed(context, '/menu_screen');
                      Navigator.pushReplacementNamed(
                          context, '/sambung_wifi_screen');
                    },
                        text: "Hidupkan Bluetooth",
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
