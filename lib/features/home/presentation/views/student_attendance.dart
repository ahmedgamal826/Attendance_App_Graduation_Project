import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Records')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('attendance').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No attendance records found.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              var name = doc.id;
              var attendanceData = doc.data() as Map<String, dynamic>;

              return Card(
                margin: EdgeInsets.all(8),
                child: ExpansionTile(
                  title:
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  children: attendanceData.entries.map((entry) {
                    String date = entry.key;
                    Map<String, dynamic> details = entry.value;
                    return ListTile(
                      title: Text(date,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "Check-in: ${details['Check-in']}\nCheck-out: ${details['Check-out']}"),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
