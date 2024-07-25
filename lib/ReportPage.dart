import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Dashboard.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _selectedMonth;
  String? _selectedYear;
  List<Map<String, dynamic>> _attendanceRecords = [];

  void _generateReport() async {
    if (_selectedMonth != null && _selectedYear != null) {
      QuerySnapshot snapshot = await _firestore.collection('attendance').get();

      List<Map<String, dynamic>> filteredRecords = [];

      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Timestamp timestamp = data['timestamp'];
        DateTime date = timestamp.toDate();
        String month = _getMonthString(date.month);
        String year = date.year.toString();

        if (month == _selectedMonth && year == _selectedYear) {
          filteredRecords.add(data);
        }
      }

      setState(() {
        _attendanceRecords = filteredRecords;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select both month and year")),
      );
    }
  }

  String _getMonthString(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Report',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
          }, icon: Icon(Icons.close_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Month'),
              items: [
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
                'July',
                'August',
                'September',
                'October',
                'November',
                'December'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedMonth = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Year'),
              items: [
                '2021',
                '2022',
                '2023',
                '2024',
                '2025',
                '2026',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedYear = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _generateReport,
                child: const Text('Generate Report'),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _attendanceRecords.isNotEmpty
                  ? ListView.builder(
                itemCount: _attendanceRecords.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> record = _attendanceRecords[index];
                  DateTime date = (record['timestamp'] as Timestamp).toDate();
                  return ListTile(
                    title: Text('Enrollment: ${record['enrollment']}'),
                    subtitle: Text('Date: ${date.toLocal()}'),
                  );
                },
              )
                  : const Center(
                child: Text('No records found for the selected month and year'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
