import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retina_app/config/url_config.dart';
import 'package:http/http.dart' as http;
import 'package:retina_app/controller/pref_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthController extends GetxController {
  TextEditingController id_device = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");

  var url_config = URL_CONFIG();
  var pref_controller = PrefController();

  Future<bool> register() async {
    String URL =
        "${url_config.getType()}://${url_config.URL()}/api/v1/register";
    final URI = Uri.parse(URL);
    Map<String, dynamic>? data;
    bool condition = false;

    try {
      final response = await http.post(URI,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
              {"id": id_device.text, "password": password.text}));

      if (response.statusCode == 201 || response.statusCode == 200) {
        data = jsonDecode(response.body);
        pref_controller.saveRegister(data!['id'], password.text);
        condition = (data['status'] == 200)? true : false;
      } else {
        condition = false;
      }
    } catch (e) {
      Exception("GAGAL MENGHUBUNGI SERVER!");
    }
    return condition;
  }


  Future<bool> login() async {
    String URL =
        "${url_config.getType()}://${url_config.URL()}/api/v1/login?device_id=${id_device.text}&password=${password.text}";
    final URI = Uri.parse(URL);
    Map<String, dynamic>? data;
    bool condition = false;

    try {
      final response = await http.post(URI,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
              {"id": id_device.text, "password": password.text}));

      if (response.statusCode == 201 || response.statusCode == 200) {
        data = jsonDecode(response.body);
        pref_controller.saveRegister(data!['id'], password.text);
        condition = data['status'];
      } else {
        condition = false;
      }
    } catch (e) {
      Exception("GAGAL MENGHUBUNGI SERVER!");
    }
    return condition;
  }

  void whatsapp() async {

  String? id_device = await pref_controller.getDevice();  

  String contact = "6285702572587";
  String text = "Halo, saya pengguna RETINA ingin mengganti password akun pada perangkat :\n\n*ID* : ${id_device}\n\n*Password Baru* : \n\n_Note_: Isi dengan password baru Anda.";
  String androidUrl = "https://wa.me/$contact/?text=$text";
  String iosUrl = "https://wa.me/$contact?text=$text";

  String webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=hi';

  try {
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(iosUrl))) {
        await launchUrl(Uri.parse(iosUrl));
      }
    } else {
      if (await canLaunchUrl(Uri.parse(androidUrl))) {
        await launchUrl(Uri.parse(androidUrl));
      }
    }
  } catch(e) {
    print('object');
    await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
  }
}
}
