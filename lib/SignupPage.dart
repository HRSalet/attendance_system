import 'package:attendance_system/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  var _isObscured;

  void initState(){
    super.initState();
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(7),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Password'),
                    suffixIcon: IconButton(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      icon: _isObscured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _isObscured =!_isObscured;
                        });
                      },
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: TextFormField(
                controller: cpassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Confirm Password'),
                    suffixIcon: IconButton(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      icon: _isObscured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _isObscured =!_isObscured;
                        });
                      },
                    )
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(7),
                child: ElevatedButton(
                    onPressed: (){
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email.text, password: password.text).then((value){
                        print("Registration Done");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      }).onError((error, stackTrace){
                        print("Errors ${error.toString()}");
                      });

                    },
                    child: Text('Register')
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Not Student?",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signuppage()));
                    },
                    child: Text("Register as Faculty", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
