import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class PanduanScreen extends StatefulWidget {
  const PanduanScreen({super.key});

  @override
  State<PanduanScreen> createState() => _PanduanScreenState();
}

class _PanduanScreenState extends State<PanduanScreen> {
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
                          "Panduan",
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
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(49, 49, 49, 100),
                              borderRadius: BorderRadius.circular(10.dm)),
                          child: Column(children: []),
                        ),
                      ),
                      SizedBox(
                        height: 95.h,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: ButtonTemplate(context, () {
                            // Navigator.pushNamed(
                            //     context, '/wifi_berhasil_screen');
                          },
                              text: "Selanjutnya",
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
