import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/bluetooth_controller.dart';
import 'package:retina_app/controller/wifi_controller.dart';
import 'package:retina_app/widget/buttons/button_template.dart';
import 'package:retina_app/widget/popup/dialog_pop.dart';

class PilihWifiScreen extends StatefulWidget {
  const PilihWifiScreen({super.key});

  @override
  State<PilihWifiScreen> createState() => _PilihWifiScreenState();
}

class _PilihWifiScreenState extends State<PilihWifiScreen> {
  RxBool isVisible = false.obs;

  var _wifiController = Get.put(WifiController());
  var _bleController = Get.put(BLEController());

  Future<void> _wifiScan() async {
    await _wifiController.wifiScan();
  }

  @override
  void initState() {
    super.initState();
    _wifiScan();
  }

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
                      Obx(
                        () => (_wifiController.list_wifi.value.length <= 0)
                            ? CircularProgressIndicator(
                                color: Colors.red,
                                strokeWidth: 4.w,
                              )
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                width: double.maxFinite,
                                child: ListView.builder(
                                    itemCount:
                                        _wifiController.list_wifi.value.length,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: InkWell(
                                          onTap: () {
                                            DialogPop(
                                              context,
                                              color: const Color.fromRGBO(
                                                  49, 49, 49, 100),
                                              height: 0.48,
                                              icon: Center(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 40.h,
                                                        bottom: 10.h),
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        "Password Wi-Fi\n${_wifiController.list_wifi.value[index].ssid}",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Hammersmith",
                                                            fontSize: 18.sp,
                                                            color: Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(
                                                              255,
                                                              255,
                                                              255,
                                                              0.984),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.dm)),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 12.dm,
                                                                left: 12.dm),
                                                        child: Obx(
                                                          () => TextFormField(
                                                            controller: _bleController.passWifi,
                                                            obscureText:
                                                                !isVisible
                                                                    .value,
                                                            decoration:
                                                                InputDecoration(
                                                                    suffixIcon:
                                                                        IconButton(
                                                                      iconSize:
                                                                          18.sp,
                                                                      splashColor:
                                                                          Colors
                                                                              .black,
                                                                      onPressed:
                                                                          () {
                                                                        isVisible.value =
                                                                            !isVisible.value;
                                                                      },
                                                                      icon: (isVisible.value ==
                                                                              false)
                                                                          ? Icon(Icons
                                                                              .visibility_off)
                                                                          : Icon(
                                                                              Icons.visibility),
                                                                    ),
                                                                    hintText:
                                                                        "Masukkan Password",
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            14.sp)),
                                                          ),
                                                        ),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20.h,
                                                        left: 15.dm,
                                                        right: 15.dm,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: SizedBox(
                                                          width: 250.w,
                                                          child: Text(
                                                            "Pastikan Wi-Fi selalu tersedia agar perangkat RETINA dapat digunakan",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 14.sp,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                  SizedBox(height: 20.h),
                                                  ButtonTemplate(
                                                        context, () async {
                                                          log("devices : ${_bleController.devices.value[_bleController.connected_index.value].remoteId.str}");
                                                          var services =  await _bleController.devices.value[_bleController.connected_index.value].discoverServices();
                                                         await _bleController.sendData(services, _wifiController.list_wifi.value[index].ssid).then((value) {
                                                          Navigator.pop(context);
                                                          if(value){
                                                            Navigator.pushReplacementNamed(context, "/wifi_berhasil_screen");
                                                          }else{
                                                            Navigator.pushReplacementNamed(context, "/wifi_gagal_screen");
                                                          }
                                                         });
                                                        },
                                                        text: "Sambungkan",
                                                        widht_percent: 0.6,
                                                        height_percent: 0.07,
                                                        radius: 50.dm),
                                                ]),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 200.w,
                                            height: 80.h,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    49, 49, 49, 100),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.dm)),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.dm),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 20.dm,
                                                        width: 20.dm,
                                                        child: CircleAvatar(
                                                            radius: 20.dm,
                                                            child: Icon(
                                                              Icons.wifi,
                                                              color:
                                                                  Colors.white,
                                                              size: 15.dm,
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            _wifiController
                                                                .list_wifi
                                                                .value[index]
                                                                .ssid,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontSize: 16.sp,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
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
