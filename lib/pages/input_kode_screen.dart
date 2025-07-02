import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/auth_controller.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class InputKodeScreen extends StatefulWidget {
  const InputKodeScreen({super.key});

  @override
  State<InputKodeScreen> createState() => _InputKodeScreenState();
}

class _InputKodeScreenState extends State<InputKodeScreen> {
  var authController = Get.put(AuthController());
  var _is_load = false.obs;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: const Color.fromRGBO(17, 17, 16, 1.0),
        systemNavigationBarColor: const Color.fromRGBO(192, 192, 192, 1),
        systemNavigationBarDividerColor: const Color.fromRGBO(17, 17, 16, 1.0),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(17, 17, 16, 1.0),
        body: SingleChildScrollView(
          // padding: EdgeInsets.only(top: 10.h),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 150.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/image/aset_bg_round_top.png",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Pendaftaran",
                          style: TextStyle(
                            fontFamily: "Hammersmith",
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 20.h),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(49, 49, 49, 1.0),
                    borderRadius: BorderRadius.circular(10.dm),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Masukkan kode yang tertera di sisi samping perangkat untuk dapat menggunakan perangkat dan membuat password.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextField(
                        cursorColor: Colors.black,
                        textAlign: TextAlign.center,
                        controller: authController.id_device,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Masukkan Kode Perangkat',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        obscureText: true,
                        cursorColor: Colors.black,
                        textAlign: TextAlign.center,
                        controller: authController.password,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Buat Password',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                            Navigator.pushNamed(context, "/login_screen");
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: "Sudah punya akun? ",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                  children: [
                                TextSpan(
                                    text: " Login",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color:
                                          const Color.fromRGBO(227, 29, 29, 1),
                                    ))
                              ])),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "retina © 2025",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                Obx(() => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: (_is_load.value)
                          ? CircularProgressIndicator(
                              color: const Color.fromRGBO(227, 29, 29, 1),
                            )
                          : ButtonTemplate(
                              context,
                              () async {
                                _is_load.value = true;

                                await authController.register().then((value) {
                                  if (value) {
                                    _is_load.value = false;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      "Pendaftaran perangkat berhasil",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    )));
                                    Navigator.pushNamed(
                                        context, "/menu_screen");
                                  } else {
                                    _is_load.value = false;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      "Maaf, perangkat sudah memiliki akun!",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    )));
                                  }
                                });
                              },
                              text: "Daftar",
                              height_percent: 0.07,
                              radius: 50.dm,
                            ),
                    )),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
