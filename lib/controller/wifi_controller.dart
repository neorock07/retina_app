import 'dart:developer';

import 'package:get/get.dart';
import 'package:wifi_hunter/wifi_hunter.dart';
import 'package:wifi_hunter/wifi_hunter_result.dart';

class WifiController extends GetxController {

  RxList<WiFiHunterResultEntry> list_wifi = <WiFiHunterResultEntry>[].obs;  


  Future<void> wifiScan()async{
    WiFiHunterResult hunter = WiFiHunterResult(); 
    try {
      hunter = (await WiFiHunter.huntWiFiNetworks)!;
      list_wifi.value = hunter.results;
    } catch (e) {
      log("==ERROR SCAN WIFI===");
    }
  }
}