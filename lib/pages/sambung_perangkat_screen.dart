import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/bluetooth_controller.dart';
import 'package:retina_app/widget/buttons/button_template.dart';
import 'package:retina_app/widget/popup/dialog_pop.dart';

class SambungPerangkatScreen extends StatefulWidget {
  const SambungPerangkatScreen({Key? key}) : super(key: key);

  @override
  _SambungPerangkatScreenState createState() => _SambungPerangkatScreenState();
}

class _SambungPerangkatScreenState extends State<SambungPerangkatScreen> {
  var _bleController = Get.put(BLEController());

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
                    ButtonTemplate(context, () async {
                      // Navigator.pushNamed(context, '/menu_screen');
                      await _bleController.Ble_check().then((value) {
                        setState(() {});

                        if (_bleController.isOn.value) {
                        Navigator.pushReplacementNamed(
                            context, '/list_ble_screen');
                      } else {
                        DialogPop(context,
                            height: 0.1,
                            icon: Center(
                                child: Row(
                              children: [
                                SizedBox(
                                  height: 20.dm,
                                  width: 20.dm,
                                  child: CircleAvatar(
                                      radius: 20.dm,
                                      child: Icon(
                                        Icons.bluetooth_sharp,
                                        color: Colors.white,
                                        size: 15.dm,
                                      )),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "Mohon hidupkan Bluetooth!",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.black,
                                      fontSize: 16.sp),
                                ),
                              ],
                            )));
                      }
                      });

                      

                      // Navigator.pushReplacementNamed(
                      //     context, '/sambung_wifi_screen');
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
