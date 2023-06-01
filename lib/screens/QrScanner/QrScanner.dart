import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String? qrData;

  Future<void> _qrScanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String? scannedData = await scanner.scan();
      setState(() {
        qrData = scannedData;
      });
    } else {
      var isGranted = await Permission.camera.request();
      if (isGranted.isGranted) {
        String? scannedData = await scanner.scan();
        setState(() {
          qrData = scannedData;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                qrData ?? 'Scan a QR code',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
