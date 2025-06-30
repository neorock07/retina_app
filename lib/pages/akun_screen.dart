import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/auth_controller.dart';
import 'package:retina_app/controller/pref_controller.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class AkunScreen extends StatefulWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  _AkunScreenState createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  var pref_controller = PrefController();
  var authController = Get.put(AuthController());
  var id_device = "".obs;
  var _credentials = {}.obs;

  void get_device() async {
    id_device.value = await pref_controller.getDevice();
  }

  void get_credentials() async {
    _credentials.value = await pref_controller.getWifi();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_device();
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
            backgroundColor: Color.fromRGBO(17, 17, 16, 1),
            body: Stack(children: [
              Image.asset("assets/image/aset_bg_round_top.png",
                  width: MediaQuery.of(context).size.width),
              Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 40.h),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Informasi Perangkat",
                        style: TextStyle(
                            fontFamily: "Hammersmith",
                            fontSize: 18.sp,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(49, 49, 49, 1),
                          borderRadius: BorderRadius.circular(10.dm)),
                      child: Center(
                        child: Obx(() => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                  "${id_device.value}",
                                  style: TextStyle(
                                      fontFamily: "Hammersmith",
                                      fontSize: 30.sp,
                                      color: const Color.fromRGBO(238, 81, 83, 1)),
                                ),
                            Text(
                                  "Wi-Fi terpilih : ${(_credentials.value['ssid'] != null)? _credentials.value['ssid'] : 'belum terkoneksi'}",
                                  style: TextStyle(
                                      fontFamily: "Hammersmith",
                                      fontSize: 16.sp,
                                      color: Color.fromARGB(255, 244, 221, 221)),
                                ),
                          ],
                        )),
                      ),
                    ),
                    // Container atas
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B2B2B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading:
                                const Icon(Icons.settings, color: Colors.white),
                            title: Text(
                              "Ganti Password?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 14.sp),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            ),
                            onTap: () {
                              authController.whatsapp();
                            },
                          ),
                          const Divider(height: 0, color: Colors.white24),
                          ListTile(
                            leading: const Icon(Icons.headset_mic,
                                color: Colors.white),
                            title: Text(
                              "Butuh Bantuan?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 14.sp),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.white),
                            onTap: () {
                              authController.call_center();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Container bawah
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B2B2B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Colors.white),
                        title: Text(
                          "Keluar",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 14.sp),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.white),
                        onTap: () async{
                          await pref_controller.clearData().then((value) {
                            Navigator.pushNamedAndRemoveUntil(context, "/start_screen", (route) => false);
                          });
                        },
                      ),
                    ),
                    Text("retina  © 2025",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 14.sp)),
                    ButtonTemplate(
                      context,
                      () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/menu_screen", (route) => false);
                      },
                      text: 'Kembali',
                      height_percent: 0.07,
                      widht_percent: 0.9,
                      radius: 50.dm,
                    )
                  ],
                ),
              ),
            ])));
  }
}
