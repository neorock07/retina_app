import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefController {
  Future<void> saveRegister(String id_device, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id_device', id_device);
    await prefs.setString('password', password);
  }

  Future<bool> clearData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }

  Future<void> cekLogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id_device = prefs.getString('id_device');

    if (id_device != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, "/menu_screen", (route) => false);
    } else {
      await prefs.clear();
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, '/input_kode_screen', (route) => false);
    }
  }

  Future<String> getDevice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id_device = prefs.getString('id_device');
    return id_device!;
  }
}
