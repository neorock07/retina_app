import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/bluetooth_controller.dart';


Widget ButtonBorder(BuildContext context, void Function() onTap,
    {
    required String text,
    Color color_border = const Color.fromRGBO(238, 83, 85, 1),
    Color color = const Color.fromRGBO(17, 17, 16, 1.0),
    num widht_percent = 0.8,
    num height_percent = 0.2,
    double radius = 10}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        onTap();
      },
      hoverColor: const Color.fromRGBO(227, 29, 29, 1),
      splashColor: const Color.fromARGB(255, 139, 32, 32),
      child: Container(
        width: MediaQuery.of(context).size.width * widht_percent,
        height: MediaQuery.of(context).size.height * height_percent,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: color_border),
            ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: "Hammersmith",
                fontSize: 18.sp,
                color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
