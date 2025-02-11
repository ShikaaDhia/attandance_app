import 'package:attandance_app/services/data_service.dart';
import 'package:attandance_app/ui/history/components/attendance_card.dart';
import 'package:attandance_app/ui/history/components/delete_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance History"),
      ),
      body: StreamBuilder(//membungkus widgetkita menjadi sebuah satu ke satuan.
        stream: dataService.dataCollection.snapshots(), //memanggil data yang kita miliki | Steam : memberitahukan si UI. 
        builder: (context, AsyncSnapshot<QuerySnapshot> snapShot) {
          if (!snapShot.hasData) {
            return const Center(
              child: Text("There is no data."),
            );
          } 

          final data = snapShot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return AttendanceHistoryCard(
                // untk mendefinisikan data yg akan muncul
                // di UI berdasarkan index/posisi yg ada di db
                data: data[index].data() as Map<String, dynamic>,
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteDialog(
                      // untk menjadikan index sebagai id dri data yg ada di db
                      documentId: data[index].id,
                      dataCollection: dataService.dataCollection,
                      // digunakan untk memperbarui state,
                      // stlh trjdi penghapusan data dri db
                      onConfirm: () {
                        setState(() {
                          dataService.deleteData(data[index].id);
                          Navigator.pop(context);
                        });
                      },
                    )
                  );
                },
              );
            },
          );
        },
      ), 
    );
  }
}