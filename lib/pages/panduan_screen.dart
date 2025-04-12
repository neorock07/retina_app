import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/widget/buttons/button_panduan.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class PanduanScreen extends StatefulWidget {
  const PanduanScreen({super.key});

  @override
  State<PanduanScreen> createState() => _PanduanScreenState();
}

class _PanduanScreenState extends State<PanduanScreen> {
  RxBool isVisible = false.obs;
  var gambarPanduan = [
    "assets/image/dummy_panduan_1.png",
    "assets/image/dummy_panduan_2.png",
    "assets/image/dummy_panduan_3.png"
  ];
  RxInt counter = 0.obs;
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
                          "Panduan",
                          style: TextStyle(
                              fontFamily: "Hammersmith",
                              fontSize: 18.sp,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Obx(
                        () => (counter.value == 0)
                            ?
                            //halaman pertama
                            Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.65,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(49, 49, 49, 100),
                                    borderRadius: BorderRadius.circular(10.dm),
                                  ),
                                  child: Column(children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.h),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/image/logo_retina_datar_white.png")))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 30.h, left: 30.h, top: 10),
                                      child: Text(
                                        "Aplikasi ini merupakan pendamping perangkat wearable asistif RETINA berbasis pada Kecerdasan Buatan yang dirancang secara khusus untuk penyandang disabilitas netra. Berfungsi menghubungkan perangkat ke Wi-Fi, aplikasi ini memungkinkan RETINA mengenali objek secara real-time dan menyampaikan deskripsi audio agar pengguna lebih mandiri dalam memahami lingkungan sekitar.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 30.h, left: 30.h, top: 10.h),
                                      child: Text(
                                        "Author : \n - Eka Yulianto (4.33.21.2.06) \n - Muhammad Naufal S. (4.33.21.2.17)",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 30.h, left: 30.h, top: 20.h),
                                      child: Text(
                                        "retina © 2025",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              )
                            : Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.65,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(49, 49, 49, 0.612),
                                      borderRadius:
                                          BorderRadius.circular(10.dm),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(gambarPanduan[
                                              counter.value - 1]))),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (counter.value == 0)
                                ? Text("")
                                : ButtonPanduan(context, () {
                                    if (counter.value <= 4) {
                                      if (counter.value > 0) {
                                        counter.value--;
                                      }
                                    }
                                    setState(() {});
                                  },
                                    text: "Kembali",
                                    height_percent: 0.07,
                                    radius: 50.dm),
                            (counter.value == 0 || counter.value == 3)
                                ? Text("")
                                : SizedBox(
                                    width: 20.w,
                                  ),
                            (counter.value == 3)
                                ? Text("")
                                : ButtonPanduan(context, () {
                                    if (counter.value < 3) {
                                      counter.value++;
                                    }

                                    setState(() {});
                                    // Navigator.pushNamed(
                                    //     context, '/wifi_berhasil_screen');
                                  },
                                    text: "Lanjut",
                                    height_percent: 0.07,
                                    radius: 30.dm),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )));
  }
}
