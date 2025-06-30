import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BLEController extends GetxController {
  bool? isSupported;
  RxBool isOn = false.obs;
  RxBool isPermanent = false.obs;
  RxString status_connection_esp = "NC".obs;

  RxList<dynamic> devices_name = [].obs;
  RxList<dynamic> devices_id = [].obs;
  RxList<dynamic> devices_rssi = [].obs;
  RxList<BluetoothDevice> devices = <BluetoothDevice>[].obs;
  RxList<BluetoothService> services = <BluetoothService>[].obs;
  RxBool isConnected = false.obs;
  RxInt connected_index = 0.obs;
  BluetoothCharacteristic? targetCharacteristic;
  RxMap<dynamic, dynamic>? perangkat_detected = <dynamic, dynamic>{}.obs;
  BluetoothDevice? selected_device;

  var passWifi = TextEditingController();
  var ssidWifi = TextEditingController();

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

  Future<void> checkAndEnableBluetooth() async {
    // Minta izin lokasi (diperlukan untuk scan bluetooth)
    await Permission.location.request();
    await Permission.bluetooth.request();
    await Permission.bluetoothConnect.request();
    await Permission.bluetoothScan.request();

    BluetoothAdapterState state = await FlutterBluePlus.adapterState.first;

    if (state != BluetoothAdapterState.on) {
      print("🔌 Bluetooth sedang mati. Silakan nyalakan secara manual.");
      await FlutterBluePlus.turnOn();
    } else {
      print("✅ Bluetooth sudah aktif");
    }
  }

  Future<dynamic> Ble_scan() async {
    // Start scanning
    FlutterBluePlus.startScan(
        timeout: Duration(seconds: 10), androidUsesFineLocation: true);
    FlutterBluePlus.setLogLevel(LogLevel.verbose, color: false);
    var subs = FlutterBluePlus.onScanResults.listen((event) async {
      log("==SCAN==");
      if (event.isNotEmpty) {
        ScanResult r = event.last;
        log('${r.device.remoteId} : "${r.advertisementData}" found!');
        // devices.value.add({"name" : r.advertisementData.localName, "id" : r.device.remoteId.str, "rssi" : r.rssi.toString() });
        if (!perangkat_detected!.containsKey(r.device.remoteId.str)) {
          perangkat_detected![r.device.remoteId] = {
            "name": r.advertisementData.localName,
            "rssi": r.rssi.toString(),
            "devices": r.device,
            "id": r.device.remoteId.str
          };
        }

        devices_name.value.add(r.advertisementData.localName);
        devices_id.value.add(r.device.remoteId.str);
        devices_rssi.value.add(r.rssi.toString());
        devices.value.add(r.device);

        devices_name.value = devices_name.value.toSet().toList();
        devices_id.value = devices_id.value.toSet().toList();
        devices_rssi.value = devices_rssi.value.toSet().toList();
        devices.value = devices.value.toSet().toList();
      }
    }, onError: (error) => log("Error scan : $error"));

    Future.delayed(Duration(seconds: 5)).then((value) {
      FlutterBluePlus.stopScan();
    });
  }

  /**
   * kirim data ke ESP32
   */
  Future<bool> sendData(dynamic services, String wifi_name) async {
    bool send_condition = false;
    var text;

    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.properties.write) {
          targetCharacteristic = characteristic;
          print("Dapat karakteristik: ${characteristic.uuid}");
          break;
        }
      }
    }

    if (isPermanent.value == true) {
      text = "${wifi_name},${passWifi.text},Y";
    } else {
      text = "${wifi_name},${passWifi.text},N";
    }

    if (targetCharacteristic == null) return false;
    final bytes = text.codeUnits;
    await targetCharacteristic!
        .write(bytes, withoutResponse: false)
        .then((value) {
      send_condition = true;
    });
    log("Terkirim: $text");
    return send_condition;
  }

  /**
   * receive data dari ESP32
   */
  Future<void> receiveData(dynamic services) async {
   
    for (var service in services) {
      for (var characteristic in service.characteristics) {
        if (characteristic.properties.notify) {
          await characteristic.setNotifyValue(true);
          characteristic.value.listen((value) {
            String status_connection = String.fromCharCodes(value);
            status_connection_esp!.value = status_connection;
            log("status : ${status_connection}");
          });

          targetCharacteristic = characteristic;
          break;
        }
      }
    }
  }
}
