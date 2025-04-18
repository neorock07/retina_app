import 'dart:developer';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BLEController extends GetxController {
  bool? isSupported;
  RxBool isOn = false.obs;
  RxList<dynamic> devices_name = [].obs;
  RxList<dynamic> devices_id = [].obs;
  RxList<dynamic> devices_rssi = [].obs;

  @override
  void onInit() {
    Ble_init();
    super.onInit();
  }

  Future<void> Ble_init() async {
    //permission Bluetooth
    await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse,
    ].request();

    // FlutterBluePlus.isAvailable.then((value) {
    //   isSupported = value;
    // });
  }

  Future<void> Ble_check() async {
    FlutterBluePlus.isOn.then((value) {
      isOn.value = value;
    });
  }

  Future<dynamic> Ble_scan() async {
    // Start scanning
    FlutterBluePlus.startScan(
        timeout: Duration(seconds: 4), androidUsesFineLocation: true);
    FlutterBluePlus.setLogLevel(LogLevel.verbose, color: false);
    var subs = FlutterBluePlus.onScanResults.listen((event) {
      log("==SCAN==");
      if (event.isNotEmpty) {
        ScanResult r = event.last;
        log('${r.device.remoteId}: "${r.advertisementData}" found!');
        // devices.value.add({"name" : r.advertisementData.localName, "id" : r.device.remoteId.str, "rssi" : r.rssi.toString() });
        devices_name.value.add(r.advertisementData.localName);
        devices_id.value.add(r.device.remoteId.str);
        devices_rssi.value.add(r.rssi.toString());
        devices_name.value = devices_name.value.toSet().toList();
        devices_id.value = devices_id.value.toSet().toList();
        devices_rssi.value = devices_rssi.value.toSet().toList();
      }
    }, onError: (error) => log("Error scan : $error"));

    Future.delayed(Duration(seconds: 5)).then((value) {
      FlutterBluePlus.stopScan();
    });
  }
}
