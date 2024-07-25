import 'dart:io';
import 'package:attendance_system/LoginPage.dart';
import 'package:attendance_system/StudentSignupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyALp0dBR3TU4tRcRTBvjDvDypyiO9POfDc",
        appId: "1:593159088327:android:95a055c54b1d8ce67f36e2",
        messagingSenderId: "593159088327",
        projectId: "attendancesystem-f1a8f"
    ),
  )
  :await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login': (context) => const LoginPage(),
        'signup': (context) => const StudentSignupPage()
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Welcome to Attendanceify',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w800,color: Colors.white),),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40,right: 40, bottom: 30),
                child: Text('Create an account to get started on your academics',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.white),textAlign: TextAlign.center,),
              ),
              SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton.icon(style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(100, 153, 2, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                  },
                  label: const Text("Login as Student",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white)),
                  ),
              ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                  },
                  label: const Text("Login as Faculty",style: TextStyle(fontWeight: FontWeight.w900)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
