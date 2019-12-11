//import 'package:flutter/material.dart';
//import 'package:qrscan/qrscan.dart' as scanner;
//
//class ScanQRCode extends StatelessWidget {
//  Future scanBarcodeNormal() async {
//    final String QRCode = await scanner.scan();
//  }
//}

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:quiz_project/student/studentMainScreen.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() {
    return _QRScannerState();
  }
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('$qrText', style: TextStyle(fontSize: 25)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
            color: Colors.white,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Studentmainscreen(qrText)),
                );
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(25.0),
                child: const Text('Take Survey',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
              ),
            ),
          )
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
