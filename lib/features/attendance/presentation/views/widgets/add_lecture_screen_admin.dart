// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AddLectureScreen extends StatefulWidget {
//   const AddLectureScreen({Key? key}) : super(key: key);

//   @override
//   State<AddLectureScreen> createState() => _AddLectureScreenState();
// }

// class _AddLectureScreenState extends State<AddLectureScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   DateTime? _selectedDate;
//   TimeOfDay? _startTime;
//   TimeOfDay? _endTime;

//   // Define consistent colors
//   final Color primaryBlue = Colors.blue[700]!;
//   final Color lightBlue = Colors.blue[50]!;
//   final Color white = Colors.white;

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(
//               primary: primaryBlue,
//               onPrimary: white,
//               onSurface: Colors.black,
//             ),
//             dialogBackgroundColor: white,
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context, bool isStart) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: isStart ? _startTime ?? TimeOfDay.now() : _endTime ?? TimeOfDay.now(),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(
//               primary: primaryBlue,
//               onPrimary: white,
//               onSurface: Colors.black,
//             ),
//             dialogBackgroundColor: white,
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStart) {
//           _startTime = picked;
//         } else {
//           _endTime = picked;
//         }
//       });
//     }
//   }

//   String _formatDate(DateTime date) {
//     return DateFormat('MMM dd, yyyy').format(date);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryBlue,
//         elevation: 0,
//         title: const Text(
//           'Add Lectures',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Container(
//         color: Colors.blue[50],
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Lecture Name Field
//             Container(
//               decoration: BoxDecoration(
//                 color: lightBlue,
//                 border: Border.all(color: primaryBlue),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   hintText: 'Lecture Name',
//                   hintStyle: TextStyle(color: primaryBlue.withOpacity(0.7)),
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.book, color: primaryBlue),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Date Field
//             InkWell(
//               onTap: () => _selectDate(context),
//               child: Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                   color: lightBlue,
//                   border: Border.all(color: primaryBlue),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.calendar_today,
//                             size: 22,
//                             color: primaryBlue,
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             _selectedDate == null ? 'Date' : _formatDate(_selectedDate!),
//                             style: TextStyle(
//                               color: _selectedDate == null ? primaryBlue.withOpacity(0.7) : Colors.black,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       color: primaryBlue,
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Time Row
//             Row(
//               children: [
//                 // Start Time
//                 Expanded(
//                   child: InkWell(
//                     onTap: () => _selectTime(context, true),
//                     child: Container(
//                       height: 55,
//                       decoration: BoxDecoration(
//                         color: lightBlue,
//                         border: Border.all(color: primaryBlue),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.access_time,
//                             size: 22,
//                             color: primaryBlue,
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             _startTime == null ? 'Start' : _startTime!.format(context),
//                             style: TextStyle(
//                               color: _startTime == null ? primaryBlue.withOpacity(0.7) : Colors.black,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(width: 15),

//                 // End Time
//                 Expanded(
//                   child: InkWell(
//                     onTap: () => _selectTime(context, false),
//                     child: Container(
//                       height: 55,
//                       decoration: BoxDecoration(
//                         color: lightBlue,
//                         border: Border.all(color: primaryBlue),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.access_time,
//                             size: 22,
//                             color: primaryBlue,
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             _endTime == null ? 'End' : _endTime!.format(context),
//                             style: TextStyle(
//                               color: _endTime == null ? primaryBlue.withOpacity(0.7) : Colors.black,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 40),

//             // Add Button
//             ElevatedButton(
//               onPressed: () {
//                 // Validate and handle adding lecture
//                 if (_nameController.text.isNotEmpty && _selectedDate != null &&
//                     _startTime != null && _endTime != null) {
//                   // Here you would add the lecture to your data structure
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: const Text('Lecture added successfully!'),
//                       backgroundColor: primaryBlue,
//                     ),
//                   );
//                   Navigator.pop(context);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: const Text('Please fill all fields'),
//                       backgroundColor: Colors.red[700],
//                     ),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: primaryBlue,
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 elevation: 5,
//               ),
//               child: const Text(
//                 'Add',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }