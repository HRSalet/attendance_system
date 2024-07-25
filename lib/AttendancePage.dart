import 'package:attendance_system/StudentDashboard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage>{
  final CollectionReference studentAttendance = FirebaseFirestore.instance.collection("attendance");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Attendance"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Studentdashboard()));
          }, icon: Icon(Icons.close_rounded))
        ],
      ),
      body: StreamBuilder(stream: studentAttendance.snapshots(), builder: (context, AsyncSnapshot<QuerySnapshot>streamSnapshot){
        if(streamSnapshot.hasData){
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context,index){
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(
                        title: Center(
                          child: Text(
                            documentSnapshot['enrollment'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }
        return Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}