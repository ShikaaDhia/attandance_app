import 'package:attandance_app/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// an entry point for submitting the attendance report
final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

Future<void> submitAttendanceReport(BuildContext context, String address, String name, String attendanceStatus, String timeStamp) async {
 showLoaderDialog(context);
 dataCollection.add(
  {
    'address': address,
    'name': name,
    'attendanceStatus': attendanceStatus,
    'timeStamp': timeStamp
  }
 ).then((result) {
  Navigator.of(context).pop();
  try {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "Attendance submitted successfully",
              style: TextStyle(color: Colors.white),
            )
          ]
        ),
        backgroundColor: Colors.orangeAccent,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
 });
}

void showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
      const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Text("Checking the data..."),
      )
    ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}