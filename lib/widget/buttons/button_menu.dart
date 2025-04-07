import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ButtonMenu(BuildContext context, void Function() onTap,
    {required String text,
    String? gambar,
    num widht_percent = 0.8,
    num height_percent = 0.4,
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
            image:
                DecorationImage(image: AssetImage(gambar!), fit: BoxFit.cover)),
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
