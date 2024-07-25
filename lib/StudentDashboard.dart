import 'package:attendance_system/AttendancePage.dart';
import 'package:attendance_system/ScanQRCodePage.dart';
import 'package:attendance_system/StudentProfilePage.dart';
import 'package:attendance_system/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Studentdashboard extends StatefulWidget {
  const Studentdashboard({super.key});

  @override
  State<Studentdashboard> createState() => _StudentdashboardState();
}

class _StudentdashboardState extends State<Studentdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),
        ],
      ),
      body:
      Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text('Student Dashboard',style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image(image: AssetImage('assets/images/student_profile.png')),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentProfilePage()));
                      }
                  ),
                  InkWell(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image(image: AssetImage('assets/images/scan_qr.png')),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScanQRCodePage()));
                      }
                  ),
                  InkWell(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image(image: AssetImage('assets/images/attendance.png')),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AttendancePage()));
                      }
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
