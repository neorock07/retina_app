import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:retina_app/config/url_config.dart';
import 'package:retina_app/controller/pref_controller.dart';

class MonitoringController extends GetxController {
  var url_config = URL_CONFIG();
  RxList<Map<String, dynamic>> data_request_month =
      <Map<String, dynamic>>[].obs;
  var total_request = 0.obs;
  var delay_request = 0.0.obs;
  var pref_controller = PrefController();


  Future<void> get_request_month() async {
  String id_device = await pref_controller.getDevice();
  String URL =
      "${url_config.getType()}://${url_config.URL()}/api/v1/requests/month?device_id=$id_device";
  final URI = Uri.parse(URL);

  try {
    final response = await http.get(
      URI,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final parsed = json.decode(response.body);

      if (parsed is List) {
        data_request_month.value = List<Map<String, dynamic>>.from(parsed);
      } else {
        print("Format data tidak sesuai (bukan List)");
      }
    } else {
      print("Gagal: Status code ${response.statusCode}");
    }
  } catch (e) {
    print("Exception: $e");
  }
}

  Future<void> get_total_request_today() async {
    String id_device = await pref_controller.getDevice();

    String URL =
        "${url_config.getType()}://${url_config.URL()}/api/v1/requests?device_id=$id_device";
    final URI = Uri.parse(URL);

    try {
      final response = await http.get(
        URI,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = jsonDecode(response.body);
        total_request.value = data['request_per_day'];
        delay_request.value = data['avg_request_delay'];
      }
    } catch (e) {
      Exception("GAGAL MENGHUBUNGI SERVER!");
    }
  }
}
