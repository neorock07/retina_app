import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retina_app/widget/buttons/button_menu.dart';
// import 'package:retina_app/widget/buttons/button_template.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
                padding: EdgeInsets.only(top:40.h, right: 15.w),
                child: Align(
                  alignment: Alignment.topRight, 
                  child: IconButton(
                              onPressed: () { 
                                Navigator.pushNamed(context, "/akun_screen");
                               },
                              icon: SizedBox(
                                    width: 30.dm,
                                    height: 30.dm,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromRGBO(115, 37, 37, 1),
                                      child: Center(
                                        child: Icon(
                                          Icons.person,
                                          size: 20.dm,
                                          color: Color.fromRGBO(255, 189, 189, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                ),
              ),
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
                        "Pilih Menu",
                        style: TextStyle(
                            fontFamily: "Hammersmith",
                            fontSize: 18.sp,
                            color: Colors.white),
                      ),
                    ),
                    ButtonMenu(context, () {
                      // Navigator.pushNamed(context, '/menu_screen');
                      Navigator.pushNamed(context, '/panduan_screen');
                    },
                        widht_percent: 0.75,
                        height_percent: 0.24,
                        radius: 10.dm,
                        text: "Panduan",
                        gambar: "assets/image/pilmenu1.png"),
                    ButtonMenu(context, () {
                      // Navigator.pushNamed(context, '/sambung_perangkat_screen');
                      Navigator.pushNamed(context, '/sambung_perangkat_screen');
                    },
                        widht_percent: 0.75,
                        height_percent: 0.24,
                        radius: 10.dm,
                        text: "Sambungkan",
                        gambar: "assets/image/pilmenu2.png"),
                    ButtonMenu(context, () {
                      // Navigator.pushNamed(context, '/input_kode_screen');
                      Navigator.pushNamed(context, '/monitor_screen');
                      // Navigator.pushNamed(context, '/input_kode_screen');
                    },
                        widht_percent: 0.75,
                        height_percent: 0.24,
                        radius: 10.dm,
                        text: "Monitoring",
                        gambar: "assets/image/pilmenu3.png"),
                  ],
                ),
              ),
            ])));
  }
}
