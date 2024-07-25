import 'package:attendance_system/FacultyProfilePage.dart';
import 'package:attendance_system/GenerateQRCodePage.dart';
import 'package:attendance_system/ReportPage.dart';
import 'package:attendance_system/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
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
                margin: const EdgeInsets.only(bottom: 20),
                child: const Column(
                  children: [
                    Text('Faculty Dashboard',style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: const SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(image: AssetImage('assets/images/faculty.png')),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FacultyProfilePage()));
                      }
                    ),
                    InkWell(
                      child: const SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(image: AssetImage('assets/images/generate_qr.png')),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const GenerateQRCodePage()));
                      }
                    ),
                    InkWell(
                      child: const SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(image: AssetImage('assets/images/report_img.png')),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ReportPage()));
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
