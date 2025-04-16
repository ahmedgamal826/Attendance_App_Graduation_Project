// import 'package:flutter/material.dart';
//
// class AdminShowDegreeOfStudent extends StatelessWidget {
//   const AdminShowDegreeOfStudent({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Student data: name and grade
//     final studentData = [
//       {'name': 'Ahmed Beherry', 'grade': '50/50'},
//       {'name': 'Ahmed Elnemr', 'grade': '10/50'},
//       {'name': 'Ahmed ElShokary', 'grade': '30/50'},
//       {'name': 'Abanoub Emad', 'grade': '55/50'},
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Center(
//           child: Text(
//             'Degrees',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         color: Colors.blue[50], // Light blue background
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: ListView.builder(
//             itemCount: studentData.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 10.0),
//                 child: Container(
//                   height: 80.0, // زيادة طول الكنتينر
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15.0),
//                     border: Border.all(color: Colors.blue, width: 2.0), // تغيير حدود الكنتينر للون الأزرق
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.blue.withOpacity(0.3),
//                         spreadRadius: 1,
//                         blurRadius: 4,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           studentData[index]['name']!,
//                           style: const TextStyle(
//                             color: Colors.black, // تغيير لون النص إلى أسود
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           studentData[index]['grade']!,
//                           style: const TextStyle(
//                             color: Colors.black, // تغيير لون النص إلى أسود
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }