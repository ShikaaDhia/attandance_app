import 'package:attandance_app/services/location_service.dart';
import 'package:attandance_app/services/timestamp_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final XFile? image;

  const AttendanceScreen({super.key, this.image});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState(this.image);
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  _AttendanceScreenState(this.image);

  XFile? image;
  String address = "", datePlaceholder = "", timePlaceholder = "", timeStampPlaceholder = "", statusPlaceholder = "Attend";
  bool isLoading = false;
  // double lat = 0.0, long = 0.0;
  // int dateHours = 0;
  final controllerName = TextEditingController();
  // final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  @override
  void initState() {
    super.initState();
    handleLocationPermission(context);
    setDateTime((date, time, timeStamp) {
      setState(() {
        datePlaceholder = date;
        timePlaceholder = time;
        timeStampPlaceholder = timeStamp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}