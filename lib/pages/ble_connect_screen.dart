// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:permission_handler/permission_handler.dart';

// class BleConnectPage extends StatefulWidget {
//   const BleConnectPage({super.key});

//   @override
//   State<BleConnectPage> createState() => _BleConnectPageState();
// }

// class _BleConnectPageState extends State<BleConnectPage> {
  
//   final String targetDeviceName = "ESP32_BLE";
//   BluetoothDevice? connectedDevice;

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     await [
//       Permission.bluetooth,
//       Permission.bluetoothScan,
//       Permission.bluetoothConnect,
//       Permission.location,
//     ].request();
//   }

//   void startScanAndConnect() async {
//     print("Memulai scanning...");
//     FlutterBluePlus.instance.startScan(timeout: const Duration(seconds: 5));

//     FlutterBluePlus.instance.scanResults.listen((results) async {
//       for (ScanResult result in results) {
//         if (result.device.localName == targetDeviceName) {
//           print("Ditemukan perangkat: ${result.device.localName}");

//           await FlutterBluePlus.instance.stopScan();
//           try {
//             await result.device.connect();
//             setState(() {
//               connectedDevice = result.device;
//             });
//             print("Berhasil terhubung ke ${result.device.localName}");
//           } catch (e) {
//             print("Gagal menghubungkan: $e");
//           }
//           break;
//         }
//       }
//     });
//   }

//   Widget deviceStatus() {
//     if (connectedDevice != null) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Terhubung ke: ${connectedDevice!.localName}"),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () async {
//               await connectedDevice!.disconnect();
//               setState(() {
//                 connectedDevice = null;
//               });
//             },
//             child: const Text("Putuskan Koneksi"),
//           )
//         ],
//       );
//     } else {
//       return const Text("Belum terhubung ke perangkat manapun.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Koneksi BLE ke ESP32"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               deviceStatus(),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: startScanAndConnect,
//                 child: const Text("Scan dan Hubungkan ke ESP32"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
