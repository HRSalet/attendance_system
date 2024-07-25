// // import 'package:attendance_system/LoginPage.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// //
// // class StudentSignupPage extends StatefulWidget {
// //   const StudentSignupPage({super.key});
// //
// //   @override
// //   State<StudentSignupPage> createState() => _StudentSignupPageState();
// // }
// //
// // class _StudentSignupPageState extends State<StudentSignupPage> {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController confirmPasswordController = TextEditingController();
// //   final TextEditingController courseController = TextEditingController();
// //   final TextEditingController enrollmentController = TextEditingController();
// //
// //   bool _isObscured = true;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _isObscured = true;
// //   }
// //
// //   void registerStudent() async {
// //     if (passwordController.text != confirmPasswordController.text) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Passwords do not match")),
// //       );
// //       return;
// //     }
// //
// //     try {
// //       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
// //         email: emailController.text,
// //         password: passwordController.text,
// //       );
// //
// //       await FirebaseFirestore.instance.collection('students').doc(userCredential.user?.uid).set({
// //         'name': nameController.text,
// //         'email': emailController.text,
// //         'course': courseController.text,
// //         'enrollment': enrollmentController.text,
// //       });
// //
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => const LoginPage()),
// //       );
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Registration failed: ${e.toString()}")),
// //       );
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Student Sign Up'),
// //       ),
// //       body: Container(
// //         width: double.infinity,
// //         height: double.infinity,
// //         padding: const EdgeInsets.all(16.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               buildTextField(enrollmentController, 'Enrollment'),
// //               buildTextField(nameController, 'Name'),
// //               buildTextField(emailController, 'Email'),
// //               buildTextField(courseController, 'Course'),
// //               buildPasswordField(passwordController, 'Password'),
// //               buildPasswordField(confirmPasswordController, 'Confirm Password'),
// //               Center(
// //                 child: Container(
// //                   margin: const EdgeInsets.symmetric(vertical: 7),
// //                   child: ElevatedButton(
// //                     onPressed: registerStudent,
// //                     child: const Text('Register'),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildTextField(TextEditingController controller, String label) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 7),
// //       child: TextFormField(
// //         controller: controller,
// //         decoration: InputDecoration(
// //           border: const OutlineInputBorder(),
// //           labelText: label,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildPasswordField(TextEditingController controller, String label) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 7),
// //       child: TextFormField(
// //         obscureText: _isObscured,
// //         controller: controller,
// //         decoration: InputDecoration(
// //           border: const OutlineInputBorder(),
// //           labelText: label,
// //           suffixIcon: IconButton(
// //             icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
// //             onPressed: () {
// //               setState(() {
// //                 _isObscured = !_isObscured;
// //               });
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // import 'package:attendance_system/LoginPage.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// //
// // class StudentSignupPage extends StatefulWidget {
// //   const StudentSignupPage({super.key});
// //
// //   @override
// //   State<StudentSignupPage> createState() => _StudentSignupPageState();
// // }
// //
// // class _StudentSignupPageState extends State<StudentSignupPage> {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController confirmPasswordController = TextEditingController();
// //   final TextEditingController courseController = TextEditingController();
// //   final TextEditingController enrollmentController = TextEditingController();
// //
// //   bool _isObscured = true;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _isObscured = true;
// //   }
// //
// //   void registerStudent() async {
// //     if (passwordController.text != confirmPasswordController.text) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Passwords do not match")),
// //       );
// //       return;
// //     }
// //
// //     try {
// //       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
// //         email: emailController.text,
// //         password: passwordController.text,
// //       );
// //
// //       await FirebaseFirestore.instance.collection('student').doc(userCredential.user?.uid).set({
// //         'name': nameController.text,
// //         'email': emailController.text,
// //         'course': courseController.text,
// //         'enrollment': enrollmentController.text,
// //         'userId': userCredential.user?.uid,
// //       });
// //
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => const LoginPage()),
// //       );
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Registration failed: ${e.toString()}")),
// //       );
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Student Sign Up'),
// //       ),
// //       body: Container(
// //         width: double.infinity,
// //         height: double.infinity,
// //         padding: const EdgeInsets.all(16.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               buildTextField(enrollmentController, 'Enrollment'),
// //               buildTextField(nameController, 'Name'),
// //               buildTextField(emailController, 'Email'),
// //               buildTextField(courseController, 'Course'),
// //               buildPasswordField(passwordController, 'Password'),
// //               buildPasswordField(confirmPasswordController, 'Confirm Password'),
// //               Center(
// //                 child: Container(
// //                   margin: const EdgeInsets.symmetric(vertical: 7),
// //                   child: ElevatedButton(
// //                     onPressed: registerStudent,
// //                     child: const Text('Register'),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildTextField(TextEditingController controller, String label) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 7),
// //       child: TextFormField(
// //         controller: controller,
// //         decoration: InputDecoration(
// //           border: const OutlineInputBorder(),
// //           labelText: label,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildPasswordField(TextEditingController controller, String label) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 7),
// //       child: TextFormField(
// //         obscureText: _isObscured,
// //         controller: controller,
// //         decoration: InputDecoration(
// //           border: const OutlineInputBorder(),
// //           labelText: label,
// //           suffixIcon: IconButton(
// //             icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
// //             onPressed: () {
// //               setState(() {
// //                 _isObscured = !_isObscured;
// //               });
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // import 'package:attendance_system/LoginPage.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// //
// // class StudentSignupPage extends StatefulWidget {
// //   const StudentSignupPage({super.key});
// //
// //   @override
// //   State<StudentSignupPage> createState() => _StudentSignupPageState();
// // }
// //
// // class _StudentSignupPageState extends State<StudentSignupPage> {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController confirmPasswordController = TextEditingController();
// //   final TextEditingController courseController = TextEditingController();
// //   final TextEditingController enrollmentController = TextEditingController();
// //
// //   bool _isObscured = true;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _isObscured = true;
// //   }
// //
// //   void registerStudent() async {
// //     if (passwordController.text != confirmPasswordController.text) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Passwords do not match")),
// //       );
// //       return;
// //     }
// //
// //     try {
// //       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
// //         email: emailController.text,
// //         password: passwordController.text,
// //       );
// //
// //       await FirebaseFirestore.instance.collection('student').doc(userCredential.user?.uid).set({
// //         'name': nameController.text,
// //         'email': emailController.text,
// //         'course': courseController.text,
// //         'enrollment': enrollmentController.text,
// //       });
// //
// //       print("Student document created with ID: ${userCredential.user?.uid}"); // Debug print
// //
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => const LoginPage()),
// //       );
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Registration failed: ${e.toString()}")),
// //       );
// //       print("Error creating student document: ${e.toString()}"); // Debug print
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Student Sign Up'),
// //       ),
// //       body: Container(
// //         width: double.infinity,
// //         height: double.infinity,
// //         padding: const EdgeInsets.all(16.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               buildTextField(enrollmentController, 'Enrollment'),
// //               buildTextField(nameController, 'Name'),
// //               buildTextField(emailController, 'Email'),
// //               buildTextField(courseController, 'Course'),
// //               buildPasswordField(passwordController, 'Password'),
// //               buildPasswordField(confirmPasswordController, 'Confirm Password'),
// //               Center(
// //                 child: Container(
// //                   margin: const EdgeInsets.symmetric(vertical: 7),
// //                   child: ElevatedButton(
// //                     onPressed: registerStudent,
// //                     child: const Text('Register'),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildTextField(TextEditingController controller, String label) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 7),
// //       child: TextFormField(
// //         controller: controller,
// //         decoration: InputDecoration(
// //           border: const OutlineInputBorder(),
// //           labelText: label,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildPasswordField(TextEditingController controller, String label) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 7),
// //       child: TextFormField(
// //         obscureText: _isObscured,
// //         controller: controller,
// //         decoration: InputDecoration(
// //           border: const OutlineInputBorder(),
// //           labelText: label,
// //           suffixIcon: IconButton(
// //             icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
// //             onPressed: () {
// //               setState(() {
// //                 _isObscured = !_isObscured;
// //               });
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:attendance_system/LoginPage.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class StudentSignupPage extends StatefulWidget {
//   const StudentSignupPage({super.key});
//
//   @override
//   _StudentSignupPageState createState() => _StudentSignupPageState();
// }
//
// class _StudentSignupPageState extends State<StudentSignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//
//   String _email = '';
//   String _password = '';
//   String _name = '';
//   String _enrollment = '';
//   String _course = '';
//
//   void _signup() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//
//       try {
//         UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//           email: _email,
//           password: _password,
//         );
//
//         User? user = userCredential.user;
//         if (user != null) {
//           await FirebaseFirestore.instance.collection('student').doc(user.uid).set({
//             'userId': user.uid,
//             'email': _email,
//             'name': _name,
//             'enrollment': _enrollment,
//             'course': _course,
//           });
//
//           // Navigate to the next screen or show a success message
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const LoginPage()),
//           );
//         }
//       } catch (e) {
//         print('Error creating user: $e');
//         // Handle error (e.g., show a message to the user)
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Signup'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _name = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Enrollment'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your enrollment number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _enrollment = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Course'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your course';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _course = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty || !value.contains('@')) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty || value.length < 6) {
//                     return 'Password must be at least 6 characters long';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _password = value!;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _signup,
//                 child: const Text('Sign Up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:attendance_system/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentSignupPage extends StatefulWidget {
  const StudentSignupPage({super.key});

  @override
  State<StudentSignupPage> createState() => _StudentSignupPageState();
}

class _StudentSignupPageState extends State<StudentSignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController enrollmentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  void registerStudent() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance.collection('student').doc(userCredential.user?.uid).set({
        'name': nameController.text,
        'email': emailController.text,
        'course': departmentController.text,
        'enrollment': enrollmentController.text,
        'userId': userCredential.user?.uid,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed: ${e.toString()}")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Student Sign Up'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField(enrollmentController, 'Enrollment'),
                buildTextField(nameController, 'Name'),
                buildTextField(emailController, 'Email'),
                buildTextField(departmentController, 'Department'),
                buildPasswordField(passwordController, 'Password'),
                buildPasswordField(confirmPasswordController, 'Confirm Password'),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: registerStudent,
                      child: const Text('Register'),
                    ),
                  ),
                ),
              ],
            ),
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
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      ),
    );
  }
}
