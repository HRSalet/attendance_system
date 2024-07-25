// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'Studentdashboard.dart';
//
// class ScanQRCodePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _ScanQRCodePageState();
// }
//
// class _ScanQRCodePageState extends State<ScanQRCodePage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       controller.pauseCamera();
//       _markAttendance(scanData.code!);
//     });
//   }
//
//   Future<void> _markAttendance(String qrCodeData) async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         // Fetch student's enrollment number from Firestore
//         DocumentSnapshot snapshot = await _firestore.collection('students').doc(user.uid).get();
//         String enrollmentNumber = snapshot['enrollment']; // Assuming 'enrollment' is the field name in Firestore
//
//         await _firestore.collection('attendance').add({
//           'userId': user.uid,
//           'enrollment': enrollmentNumber, // Store enrollment number
//           'qrCodeData': qrCodeData,
//           'timestamp': FieldValue.serverTimestamp(),
//         });
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Attendance marked successfully')),
//         );
//
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const Studentdashboard()),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error marking attendance: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scan QR Code'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => Studentdashboard()),
//             );
//           },
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => Studentdashboard()),
//                   );
//                 },
//                 child: const Text('Back to Dashboard'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Studentdashboard.dart';

class ScanQRCodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanQRCodePageState();
}

class _ScanQRCodePageState extends State<ScanQRCodePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      _markAttendance(scanData.code!);
    });
  }

  Future<void> _markAttendance(String qrCodeData) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Fetch student enrollment from Firestore
        DocumentSnapshot studentSnapshot = await _firestore.collection('student').doc(user.uid).get();
        if (studentSnapshot.exists) {
          String enrollment = studentSnapshot['enrollment'];
          print(enrollment);

          // Add attendance record to Firestore
          await _firestore.collection('attendance').add({
            'userId': user.uid,
            'qrCodeData': qrCodeData,
            'enrollment': enrollment,
            'timestamp': FieldValue.serverTimestamp(),
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Attendance marked successfully')),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Studentdashboard()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Student data not found')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error marking attendance: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Studentdashboard()),
            );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Studentdashboard()),
                  );
                },
                child: const Text('Back to Dashboard'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
