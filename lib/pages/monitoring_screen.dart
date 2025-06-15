import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:retina_app/controller/monitoring_controller.dart';
import 'package:retina_app/widget/buttons/button_template.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({Key? key}) : super(key: key);

  @override
  _MonitoringScreenState createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  var monitorController = Get.put(MonitoringController());
  Timer? _monitorTimer;

  void get_data_monitor() async {
    await monitorController.get_total_request_today();
    await monitorController.get_request_month();
  }

  @override
  void initState() {
    super.initState();
    get_data_monitor();

    _monitorTimer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      get_data_monitor();
    });
  }

  @override
  void dispose() {
    // hentikan timer saat keluar dari page
    _monitorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 17, 16, 1.0),
      body: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.45,
          child: Stack(
            children: [
              Image.asset(
                "assets/image/aset_bg_round_top.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Monitoring Perangkat",
                    style: TextStyle(
                      fontFamily: "Hammersmith",
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(49, 49, 49, 1),
                        borderRadius: BorderRadius.circular(10.dm),
                      ),
                      child: SizedBox(
                        height: 100.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 30.dm,
                                  height: 30.dm,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromRGBO(115, 37, 37, 1),
                                    child: Center(
                                      child: Icon(
                                        Icons.track_changes_sharp,
                                        size: 20.dm,
                                        color: Color.fromRGBO(250, 80, 80, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    "Total request hari ini",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: "Arial",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                              ],
                            ),
                            SizedBox(
                              height: 60.h,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Obx(() {
                                  return Text(
                                    "${monitorController.total_request.value}",
                                    style: TextStyle(
                                      fontFamily: "Hammersmith",
                                      fontSize: 40.sp,
                                      color: Colors.white,
                                    ),
                                  );
                                }))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(49, 49, 49, 1),
                        borderRadius: BorderRadius.circular(10.dm),
                      ),
                      child: SizedBox(
                        height: 100.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 30.dm,
                                  height: 30.dm,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromRGBO(37, 65, 115, 1),
                                    child: Center(
                                      child: Icon(
                                        Icons.timelapse,
                                        size: 20.dm,
                                        color: Color.fromRGBO(80, 137, 250, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    "Avg. Respon Time hari ini",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: "Arial",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                              ],
                            ),
                            SizedBox(
                              height: 60.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Obx(() => RichText(
                                    text: TextSpan(
                                        text:
                                            "${monitorController.delay_request.value}",
                                        style: TextStyle(
                                          fontFamily: "Hammersmith",
                                          fontSize: 40.sp,
                                          color: Colors.white,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "detik",
                                            style: TextStyle(
                                              fontFamily: "Hammersmith",
                                              fontSize: 10.sp,
                                              color: Colors.white,
                                            ),
                                          )
                                        ]),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.dm),
            color: Color.fromRGBO(49, 49, 49, 1),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Text(
                "Avg. Respon Time bulan ini",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Hammersmith",
                  fontSize: 15.sp,
                  // fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 2.dm, left: 5.dm),
                  child: Obx(() => LineChart(
                        swapAnimationDuration:
                            const Duration(milliseconds: 300),
                        swapAnimationCurve: Curves.easeIn,
                        LineChartData(
                          minX: 1,
                          maxX: 5,
                          minY: 0,
                          maxY: 100,
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              axisNameWidget: Text("minggu",
                                  style: TextStyle(
                                      fontFamily: "Arial",
                                      color: Colors.grey,
                                      fontSize: 12.sp)),
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, _) => Text(
                                  'W${value.toInt()}',
                                  style: TextStyle(
                                      fontFamily: "Arial",
                                      color: Colors.grey,
                                      fontSize: 12.sp),
                                ),
                                interval: 1,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              axisNameWidget: Text("detik",
                                  style: TextStyle(
                                      fontFamily: "Arial",
                                      color: Colors.grey,
                                      fontSize: 12.sp)),
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                interval: 20,
                                getTitlesWidget: (value, _) => Text(
                                    '${value.toInt()}',
                                    style: TextStyle(
                                        fontFamily: "Arial",
                                        color: Colors.grey,
                                        fontSize: 12.sp)),
                              ),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: monitorController.data_request_month.value
                                  .map((point) {
                                return FlSpot(
                                  point["week"].toDouble(),
                                  point["avg_delay"].toDouble(),
                                );
                              }).toList(),
                              isCurved: true,
                              barWidth: 3,
                              color: Colors.blue,
                              dotData: FlDotData(show: true),
                            ),
                          ],
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(
                              show: true,
                              border:
                                  Border.all(color: Colors.grey, width: 1.dm)),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10.h),
        ButtonTemplate(
          context,
          () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/menu_screen", (route) => false);
          },
          text: 'Kembali ke Menu',
          height_percent: 0.07,
          radius: 50.dm,
        )
      ]),
    );
  }
}
