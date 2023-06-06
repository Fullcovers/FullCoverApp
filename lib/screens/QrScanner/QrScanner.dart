import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:venq_assessment/Services/Order_Services.dart';

import '../../Providers/UserProvider.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String qrData = '';

  Future<void> _qrScanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String? scannedData = await scanner.scan();
      setState(() {
        qrData = scannedData!;
      });
      // userprovider.deleteToken();
    } else {
      var isGranted = await Permission.camera.request();
      if (isGranted.isGranted) {
        String? scannedData = await scanner.scan();
        setState(() {
          qrData = scannedData!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _qrScanner,
                child: Text("Open QR code"),
              ),
              SizedBox(height: 20),
              Text(
                qrData,
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  OrderServices()
                      .checkvalidateQrCode(id: qrData, context: context);
                },
                child: Text("check qr code status"),
              ),
              ElevatedButton(
                onPressed: () {
                  OrderServices().validateQrCode(id: qrData, context: context);
                },
                child: Text("change qrcode status"),
              ),
              ElevatedButton(
                onPressed: () {
                  userprovider.deleteToken();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login', (route) => false);
                },
                child: const Text("logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
