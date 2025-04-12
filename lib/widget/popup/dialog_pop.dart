import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * untuk alert dialog
 * 
 */

Future<dynamic> DialogPop(BuildContext context,
    {Widget? icon,
    double height = 0.05,
    double width = 0.8,
    bool is_good = true,
    String? label,
    bool? dismissable = true}) {
  return showDialog(
      context: context,
      barrierDismissible: dismissable!,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Loading..."),
          backgroundColor: Colors.white,
          content: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.elasticIn,
              height: MediaQuery.of(context).size.height * height,
              width: MediaQuery.of(context).size.height * width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.dm),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  TextFormField(),
                ],
              )),
        );
      });
}
