import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'StudentDashboard.dart';
import 'Dashboard.dart';
import 'StudentSignupPage.dart';
import 'FacultySignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscured = true;
  String _role = 'student';  // Default role

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      String userId = userCredential.user?.uid ?? '';

      DocumentSnapshot userDoc;
      if (_role == 'faculty') {
        userDoc = await FirebaseFirestore.instance.collection('faculty').doc(userId).get();
      } else {
        userDoc = await FirebaseFirestore.instance.collection('student').doc(userId).get();
      }

      if (userDoc.exists) {
        if (_role == 'faculty') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Studentdashboard()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not found in the selected role")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.toString()}")),
      );
    }
  }

  void navigateToSignupPage() {
    if (_role == 'faculty') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultySignupPage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentSignupPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(emailController, 'Email'),
              buildPasswordField(passwordController, 'Password'),
              DropdownButton<String>(
                value: _role,
                items: const [
                  DropdownMenuItem(value: 'student', child: Text('Student')),
                  DropdownMenuItem(value: 'faculty', child: Text('Faculty')),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _role = newValue ?? 'student';
                  });
                },
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  child: ElevatedButton(
                    onPressed: login,
                    child: const Text('Login'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: navigateToSignupPage,
                    child: const Text("Sign Up Now", style: TextStyle(fontSize: 15, color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixIcon: Icon(Icons.email_rounded)
        ),
      ),
    );
  }

  Widget buildPasswordField(TextEditingController controller, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        obscureText: _isObscured,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixIcon: IconButton(
            icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          ),
        ),
      ),
    );
  }
}
