import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class InputKodeScreen extends StatefulWidget {
  const InputKodeScreen({super.key});

  @override
  State<InputKodeScreen> createState() => _InputKodeScreenState();
}

class _InputKodeScreenState extends State<InputKodeScreen> {
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
        body: Stack(
          children: [
            Image.asset(
              "assets/image/aset_bg_round_top.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h, bottom: 40.h),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Masukkan Kode",
                      style: TextStyle(
                        fontFamily: "Hammersmith",
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 120.h),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 25.h),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(49, 49, 49, 1.0),
                        borderRadius: BorderRadius.circular(10.dm),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Masukkan kode yang tertera di samping QR Code untuk dapat menggunakan perangkat.",
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
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Masukkan Kode Perangkat',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
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
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: ButtonTemplate(
                      context,
                      () {
                        Navigator.pop(context);
                      },
                      text: "Konfirmasi",
                      height_percent: 0.07,
                      radius: 50.dm,
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
