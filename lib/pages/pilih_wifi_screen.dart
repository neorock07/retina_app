import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class PilihWifiScreen extends StatefulWidget {
  const PilihWifiScreen({super.key});

  @override
  State<PilihWifiScreen> createState() => _PilihWifiScreenState();
}

class _PilihWifiScreenState extends State<PilihWifiScreen> {
  RxBool isVisible = false.obs;
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
            body: SingleChildScrollView(
              child: Stack(children: [
                Image.asset("assets/image/aset_bg_round_top.png",
                    width: MediaQuery.of(context).size.width),
                Padding(
                  padding: EdgeInsets.only(top: 60.h, bottom: 10.h),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Sambungkan Wi-Fi",
                          style: TextStyle(
                              fontFamily: "Hammersmith",
                              fontSize: 18.sp,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.55,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(49, 49, 49, 100),
                              borderRadius: BorderRadius.circular(10.dm)),
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
                              child: Text(
                                "Nama Wi-Fi",
                                style: TextStyle(
                                    fontFamily: "Hammersmith",
                                    fontSize: 18.sp,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.984),
                                    borderRadius: BorderRadius.circular(10.dm)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 12.dm, left: 12.dm),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Masukkan Nama Wi-Fi",
                                      hintStyle: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
                              child: Text(
                                "Password Wi-Fi",
                                style: TextStyle(
                                    fontFamily: "Hammersmith",
                                    fontSize: 18.sp,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.984),
                                    borderRadius: BorderRadius.circular(10.dm)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 12.dm, left: 12.dm),
                                  child: Obx(
                                    () => TextFormField(
                                      obscureText: !isVisible.value,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            iconSize: 18.sp,
                                            splashColor: Colors.black,
                                            onPressed: () {
                                              isVisible.value =
                                                  !isVisible.value;
                                            },
                                            icon: (isVisible.value == false)
                                                ? Icon(Icons.visibility_off)
                                                : Icon(Icons.visibility),
                                          ),
                                          hintText: "Masukkan Password",
                                          hintStyle:
                                              TextStyle(fontSize: 14.sp)),
                                    ),
                                  ),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 40.h, bottom: 15.h),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 250.w,
                                    child: Text(
                                      "Pastikan Wi-Fi selalu tersedia agar perangkat RETINA dapat digunakan",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: ButtonTemplate(context, () {
                            Navigator.pushReplacementNamed(
                                context, '/wifi_berhasil_screen');
                            // Navigator.pushReplacementNamed(
                            //     context, '/pilih_wifi_screen');
                          },
                              text: "Connect",
                              height_percent: 0.07,
                              radius: 50.dm),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )));
  }
}
