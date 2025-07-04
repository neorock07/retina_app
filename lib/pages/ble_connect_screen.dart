import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/bluetooth_controller.dart';
import 'package:retina_app/widget/buttons/button_connect.dart';
import 'package:retina_app/widget/buttons/button_template.dart';
import 'package:retina_app/widget/popup/dialog_pop.dart';

class BleConnectScreen extends StatefulWidget {
  const BleConnectScreen({Key? key}) : super(key: key);

  @override
  _BleConnectScreenState createState() => _BleConnectScreenState();
}

class _BleConnectScreenState extends State<BleConnectScreen> {
  var _bleController = Get.put(BLEController());
  var _isPressed = false.obs;
  var _selected_index = 0.obs;

  Future<void> _BleScanImplement() async {
    log("jalan ra sih");
    await _bleController.Ble_scan();
  }

  Function? _onError(){
    DialogPop(context, icon: Center(child: Text("Gagal menghubungkan!"),));
  }

  @override
  void initState() {
    super.initState();
    _BleScanImplement();
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Daftar Perangkat",
                  style: TextStyle(
                      fontFamily: "Hammersmith",
                      fontSize: 18.sp,
                      color: Colors.white),
                ),
              ),
            ),
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
            Center(
                child: Obx(
              () => (_bleController.perangkat_detected!.isEmpty)
              // () => (_bleController.devices_name.value.isEmpty)
                  ? CircularProgressIndicator(
                      color: Colors.red,
                      strokeWidth: 4.w,
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.maxFinite,
                      child: ListView.builder(
                          padding: EdgeInsets.all(10.dm),
                          itemCount: _bleController.perangkat_detected!.length,
                          // itemCount: _bleController.devices_name.length,
                          itemBuilder: (_, index) {
                            var list_perangkat = _bleController.perangkat_detected!.values.toList();

                            return Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Container(
                                width: 200.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(49, 49, 49, 100),
                                    borderRadius: BorderRadius.circular(10.dm)),
                                child: Padding(
                                  padding: EdgeInsets.all(10.dm),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
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
                                            width: 10.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // _bleController
                                                //     .devices_name.value[index],
                                                list_perangkat[index]['name'],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 16.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                // _bleController
                                                //     .devices_id.value[index],
                                                list_perangkat[index]['id'],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 14.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.signal_cellular_4_bar,
                                                    color: Colors.white,
                                                    size: 12.dm,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    "${list_perangkat[index]['rssi']} dBm",
                                                    // "${_bleController.devices_rssi.value[index]} dBm",
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 12.sp,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Obx(() => (_isPressed.value == true && _selected_index.value == index)?
                                        const CircularProgressIndicator(color: Colors.red,)
                                        :
                                        ButtonConnect(context,
                                              () async {
                                            // var subs = _bleController.devices
                                            //     .value[index].connectionState
                                            _isPressed.value = true;
                                            _selected_index.value = index;
                                             var subs = list_perangkat[index]['devices']
                                                .connectionState   
                                                .listen((event) async {
                                              if (event ==
                                                  BluetoothConnectionState
                                                      .disconnected) {
                                                log("${list_perangkat[index]['devices'].disconnectReason?.code} ${list_perangkat[index]['devices'].disconnectReason?.description}");
                                                // log("${_bleController.devices.value[index].disconnectReason?.code} ${_bleController.devices.value[index].disconnectReason?.description}");
                                                _bleController.selected_device = list_perangkat[index]['devices']; 
                                                await list_perangkat[index]['devices']
                                                    .connect(
                                                        timeout: const Duration(
                                                            seconds: 15))
                                                    .then(
                                                      (value) {
                                                        _isPressed.value = false;
                                                  _bleController
                                                      .isConnected.value = true;
                                                  _bleController.connected_index
                                                      .value = index;

                                                  Navigator.pushNamedAndRemoveUntil(context, "/pilih_wifi_screen", (route) => false);    
                                                },
                                                
                                                );
                                              }
                                            });
                                          },
                                              text: (_bleController
                                                          .isConnected.value &&
                                                      index ==
                                                          _bleController
                                                              .connected_index
                                                              .value)
                                                  ? "CONNECTED"
                                                  : "CONNECT",
                                              height_percent: 0.05,
                                              widht_percent: (_bleController
                                                          .isConnected.value &&
                                                      index ==
                                                          _bleController
                                                              .connected_index
                                                              .value)
                                                  ? 0.28
                                                  : 0.25,
                                              radius: 5.dm))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            )),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTemplate(context, () async {
                    _bleController.perangkat_detected!.clear();
                    await _BleScanImplement();
                    setState(() {});
                  }, text: "SCAN", height_percent: 0.07, radius: 50.dm)),
            )
          ],
        ),
      ),
    );
  }
}
