import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retina_app/pages/akun_screen.dart';
import 'package:retina_app/pages/ble_connect_screen.dart';
import 'package:retina_app/pages/connecting_screen.dart';
import 'package:retina_app/pages/input_kode_screen.dart';
import 'package:retina_app/pages/login_screen.dart';
import 'package:retina_app/pages/menu_screen.dart';
import 'package:retina_app/pages/monitoring_screen.dart';
import 'package:retina_app/pages/panduan_screen.dart';
import 'package:retina_app/pages/pilih_wifi_screen.dart';
import 'package:retina_app/pages/sambung_perangkat_gagal_screen.dart';
import 'package:retina_app/pages/sambung_perangkat_screen.dart';
import 'package:retina_app/pages/sambung_wifi_screen.dart';
import 'package:retina_app/pages/splash_screen.dart';
import 'package:retina_app/pages/start_screen.dart';
import 'package:retina_app/pages/wifi_berhasil_screen.dart';
import 'package:retina_app/pages/wifi_gagal_screen.dart';

/*
* 
Class untuk route page
*/
class Routers {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/start_screen":
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case "/input_kode_screen":
        return MaterialPageRoute(builder: (_) => const InputKodeScreen());
      
      case "/monitor_screen":
        return MaterialPageRoute(builder: (_) => const MonitoringScreen());
      
      case "/connecting_screen":
        return MaterialPageRoute(builder: (_) => const ConnectingScreen());
      
      case "/login_screen":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      
      case "/menu_screen":
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case "/list_ble_screen":
        return MaterialPageRoute(builder: (_) => const BleConnectScreen());
      case "/sambung_perangkat_screen":
        return MaterialPageRoute(
            builder: (_) => const SambungPerangkatScreen());
      case "/sambung_perangkat_gagal_screen":
        return MaterialPageRoute(
            builder: (_) => const SambungPerangkatGagalScreen());
      case "/sambung_wifi_screen":
        return MaterialPageRoute(builder: (_) => const SambungWifiScreen());
      case "/pilih_wifi_screen":
        return MaterialPageRoute(builder: (_) => const PilihWifiScreen());
      case "/wifi_berhasil_screen":
        return MaterialPageRoute(builder: (_) => const WifiBerhasilScreen());
      case "/wifi_gagal_screen":
        return MaterialPageRoute(builder: (_) => const WifiGagalScreen());
      case "/panduan_screen":
        return MaterialPageRoute(builder: (_) => const PanduanScreen());
      case "/akun_screen":
        return MaterialPageRoute(builder: (_) => const AkunScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          backgroundColor: Color.fromRGBO(17, 17, 16, 1.0),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                "Maaf Anda Kurang Beruntung, Coba Lagi!",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14.sp,
                    color: Colors.white),
              ),
            ),
          ));
    });
  }
}
