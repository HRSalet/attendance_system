import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'Dashboard.dart';  // Import the Dashboard page

class GenerateQRCodePage extends StatefulWidget {
  const GenerateQRCodePage({super.key});

  @override
  State<GenerateQRCodePage> createState() => _GenerateQRCodePageState();
}

class _GenerateQRCodePageState extends State<GenerateQRCodePage> {
  final TextEditingController semesterController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String qrData = '';

  void generateQRCode() {
    String semester = semesterController.text;
    String className = classController.text;
    String subject = subjectController.text;
    String date = dateController.text;

    if (semester.isNotEmpty && className.isNotEmpty && subject.isNotEmpty && date.isNotEmpty) {
      setState(() {
        qrData = '$semester|$className|$subject|$date';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Generate QR Code'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(semesterController, 'Enter Semester'),
              buildTextField(classController, 'Enter Class'),
              buildTextField(subjectController, 'Enter Subject Name'),
              buildTextField(dateController, 'Enter Date (dd/mm/yyyy)'),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  child: ElevatedButton(
                    onPressed: generateQRCode,
                    child: const Text('Generate QR Code'),
                  ),
                ),
              ),
              if (qrData.isNotEmpty)
                Center(
                  child: QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Dashboard()),
                      );
                    },
                    child: const Text('Back to Dashboard'),
                  ),
                ),
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
        ),
      ),
    );
  }
}
