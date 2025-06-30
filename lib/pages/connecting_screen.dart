import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/bluetooth_controller.dart';
import 'package:retina_app/controller/pref_controller.dart';

class ConnectingScreen extends StatefulWidget {
  const ConnectingScreen({Key? key}) : super(key: key);

  @override
  _ConnectingScreenState createState() => _ConnectingScreenState();
}

class _ConnectingScreenState extends State<ConnectingScreen> {
  late Stream<BluetoothConnectionState> connectionStream;
  BluetoothConnectionState _currentState =
      BluetoothConnectionState.disconnected;
  var _bleController = Get.put(BLEController());
  var _prefController = Get.put(PrefController());

  int secondsRemaining = 20;
  Timer? _timer;

  void receiveStatus()async{
     var services =
        await _bleController.devices[_bleController.connected_index.value].discoverServices();

    await _bleController.receiveData(services);
  }  

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        print("Waktu habis!");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    receiveStatus();
    startTimer();
    connectionStream = _bleController.selected_device!.connectionState;

    connectionStream.listen((state) {
      setState(() {
        _currentState = state;
      });

      if (state == BluetoothConnectionState.disconnected && _bleController.status_connection_esp!.value == "CN") {
        if(_bleController.isPermanent.value == true){
            _prefController.saveWifi(_bleController.ssidWifi.text, _bleController.passWifi.text);
        }
        Navigator.pushNamedAndRemoveUntil(context, "/wifi_berhasil_screen", (route) => false);
        print("🔴 Perangkat terputus & berhasil konek!");
      } else if (state == BluetoothConnectionState.connected && secondsRemaining == 0 && _bleController.status_connection_esp!.value == "NC" ) {
        Navigator.pushNamedAndRemoveUntil(context, "/wifi_gagal_screen", (route) => false);
        
        print("🟢 Perangkat terhubung!");
      }
    });
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
                    SpinKitFoldingCube(
                      color: Colors.red,
                    ),
                    Text(
                      "Mohon tunggu, perangkat RETINA sedang menghubungkan ke WiFi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
