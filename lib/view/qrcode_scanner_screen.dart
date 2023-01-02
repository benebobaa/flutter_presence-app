import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final _qrKey = GlobalKey();
  QRViewController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: QRView(
            // overlay: QrScannerOverlayShape(overlayColor: Colors.white),
            key: _qrKey,
            onQRViewCreated: (QRViewController controller) {
              this._controller = controller;
            },
          ),
        ),
      )),
    );
  }
}


// Stack(
//           children: [
//             QRView(
//               overlay: QrScannerOverlayShape(overlayColor: Colors.white),
//               key: _qrKey,
//               onQRViewCreated: (QRViewController controller) {
//                 this._controller = controller;
//               },
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 margin: EdgeInsets.only(top: 50),
//                 child: Text('Scan QRCode'),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ButtonBar(
//                 alignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.person),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),