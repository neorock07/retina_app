import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/bluetooth_controller.dart';

var bleController = Get.put(BLEController());
bool isPressed = false;

Widget ButtonConnect(BuildContext context, void Function() onTap,
    {
    required String text,
    Color color1 = const Color.fromRGBO(238, 83, 85, 1),
    Color color2 = const Color.fromRGBO(227, 29, 29, 1),
    num widht_percent = 0.8,
    num height_percent = 0.2,
    double radius = 10}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        // if(bleController.isConnected.value == true){
          onTap();
        // }else{
        // }
          SizedBox(
          height: 30.dm,
          width: 30.dm,
          child: CircularProgressIndicator(color: Colors.white,));
        
      },
      hoverColor: const Color.fromRGBO(227, 29, 29, 1),
      splashColor: const Color.fromARGB(255, 139, 32, 32),
      child: Container(
        width: MediaQuery.of(context).size.width * widht_percent,
        height: MediaQuery.of(context).size.height * height_percent,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
        child: Center(
          child: (bleController.isConnected.value == false && isPressed == true)? 
             SizedBox(
          height: 30.dm,
          width: 30.dm,
          child: CircularProgressIndicator(color: Colors.white,))
          :
          Text(
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
